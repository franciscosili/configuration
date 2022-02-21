# vim:ft=zsh ts=2 sw=2 sts=2

NEWLINE=$'\n'

local current_time="%{$B$FG[009]%}%*%{$reset_color%}"
# dashed separator size
function afmagic_dashes {
  # check either virtualenv or condaenv variables
  python_env="${VIRTUAL_ENV:-$CONDA_DEFAULT_ENV}"

  # if there is a python virtual environment and it is displayed in
  # the prompt, account for it when returning the number of dashes
  if [[ -n "$python_env" ]]; then
    echo $(( $COLUMNS - ${#python_env} - 5 - ${#current_time}))
  else
    echo $(( $COLUMNS - ${#current_time} - $COLUMNS/6))
  fi
}

local user_host="%{$FG[123]%}%n%{$FG[123]%}@%{$B$FG[123]%}%m%{$reset_color%}"
local current_dir="%{$FG[120]%}[%(5~|%-1~/…/%3~|%4~)]%{$reset_color%}"
local prompt="%{$B$FG[214]%}$ %{$reset_color%}"
dashed_lines="${(l.$(afmagic_dashes)..-.)}"
git_prompt='%{$B$FG[green]%}$(git_prompt_info)%{$reset_color%}%'


PROMPT="⌚ ${current_time} ${git_prompt}     ${dashed_lines}${NEWLINE}${user_host}: ${current_dir}${NEWLINE}${prompt}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}<%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}✗%{$fg[green]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}>"
