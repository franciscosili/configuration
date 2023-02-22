# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://gist.github.com/1595572).
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](https://iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# If using with "light" variant of the Solarized color schema, set
# SOLARIZED_THEME variable to "light". If you don't specify, we'll assume
# you're using the "dark" variant.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'

# Characters
SEGMENT_SEPARATOR="\ue0b0"

# Begin a segment
# Takes two arguments: background and foreground. Foreground can be set to
# "contrast" which uses the default background as foreground.
# Optional text as third argument.
prompt_segment() {
  # Render a separator if the color changes
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    # invert to use default background as separator foreground
    if [[ $CURRENT_BG == "default" ]]; then
      print -n "%{%S%F{$1}%k%}$SEGMENT_SEPARATOR"
    else
      print -n "%{%s%K{$1}%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
    fi
  fi

  # invert to use background "contrast" as foreground color
  if [[ "$2" == "contrast" ]]; then
    print -n "%{%S%F{$1}%k%}"
  else
    print -n "%{%s%K{$1}%F{$2}%}"
  fi

  CURRENT_BG=$1
  [[ -n $3 ]] && print -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  print -n "%{%s%}"
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    print -n "%{%k%}"
  fi
  print
  print -n "%{%F{yellow}%}❯%{%f%}"
  CURRENT_BG=''
}

prompt_newline(){
  print -n "%{%s%}"
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    print -n "%{%k%}"
  fi
  print
#   print -n "%{%F{green}%}❯%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    prompt_segment cyan contrast "%(!.%{%F{yellow}%}.)$user@%m "
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local color ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref="$vcs_info_msg_0_"
  if [[ -n "$ref" ]]; then
    if is_dirty; then
      color=yellow
      ref="${ref} \u00b1"
    else
      color=green
      ref="${ref} "
    fi
    if [[ "${ref/.../}" == "$ref" ]]; then
      ref="\ue0a0 $ref"
    else
      ref="\u27a6 ${ref/.../}"
    fi
    prompt_segment $color contrast
    print -n " $ref "
  fi
}

prompt_bzr() {
    (( $+commands[bzr] )) || return
    if (bzr status >/dev/null 2>&1); then
        status_mod=`bzr status | head -n1 | grep "modified" | wc -m`
        status_all=`bzr status | head -n1 | wc -m`
        revision=`bzr log | head -n2 | tail -n1 | sed 's/^revno: //'`
        if [[ $status_mod -gt 0 ]] ; then
            prompt_segment yellow black
            echo -n "bzr@"$revision "✚ "
        else
            if [[ $status_all -gt 0 ]] ; then
                prompt_segment yellow black
                echo -n "bzr@"$revision

            else
                prompt_segment green black
                echo -n "bzr@"$revision
            fi
        fi
    fi
}

prompt_hg() {
  (( $+commands[hg] )) || return
  local rev status
  if $(hg id >/dev/null 2>&1); then
    if $(hg prompt >/dev/null 2>&1); then
      if [[ $(hg prompt "{status|unknown}") = "?" ]]; then
        # if files are not added
        prompt_segment red white
        st='±'
      elif [[ -n $(hg prompt "{status|modified}") ]]; then
        # if any modification
        prompt_segment yellow black
        st='±'
      else
        # if working copy is clean
        prompt_segment green black
      fi
      echo -n $(hg prompt "☿ {rev}@{branch}") $st
    else
      st=""
      rev=$(hg id -n 2>/dev/null | sed 's/[^-0-9]//g')
      branch=$(hg id -b 2>/dev/null)
      if `hg st | grep -q "^\?"`; then
        prompt_segment red black
        st='±'
      elif `hg st | grep -q "^[MA]"`; then
        prompt_segment yellow black
        st='±'
      else
        prompt_segment green black
      fi
      echo -n "☿ $rev@$branch" $st
    fi
  fi
}


# Dir: current working directory
prompt_dir() {
  prompt_segment blue contrast ' %~ '
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}\u2718 $RETVAL"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}\u26a1"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}\u2699"

  [[ -n "$symbols" ]] && prompt_segment default default "$symbols "
}

# Display current virtual environment
prompt_virtualenv() {
  if [[ -n $CONDA_DEFAULT_ENV ]]; then
    prompt_segment violet contrast
    print -Pn " $(basename $CONDA_DEFAULT_ENV) "
  fi
}

prompt_time() {
  prompt_segment red contrast " %D{%d/%m/%y %H:%M:%S} "
}


# Main prompt
prompt_agnoster_main() {
  RETVAL=$?
  CURRENT_BG='NONE'

  prompt_status
  prompt_virtualenv
  prompt_time
  prompt_git
  prompt_bzr
  prompt_hg
  prompt_context

  prompt_newline
  CURRENT_BG='NONE'
  prompt_dir
  prompt_end
  print -n "\n"
}

prompt_agnoster_precmd() {
  vcs_info
  PROMPT='%{%f%b%k%}$(prompt_agnoster_main) '
}

prompt_agnoster_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  add-zsh-hook precmd prompt_agnoster_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_agnoster_setup "$@"