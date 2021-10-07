parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\[\e[m\]\[\e[91m\]$(parse_git_branch)\[\e[00m\]\n\[\e[0;1;38;5;123m\]\u\[\e[0;1;38;5;123m\]@\[\e[0;1;38;5;123m\]\h\[\e[0m\]:\[\e[m\] \[\e[0;38;5;157m\][\[\e[0;38;5;157m\]\w\[\e[0;38;5;157m\]]\[\e[m\]\n\[\e[0;1;38;5;215m\]$\[\e[0;1;38;5;215m\]\[\e[m\] \[\e0'
export CLICOLOR=1

# Change colors of files and folders in ls
export LSCOLORS=GxfxcxdxBxegedabagacad
export TERM=xterm-256color


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# alias definitions
if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
