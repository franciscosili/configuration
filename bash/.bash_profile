if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

export BASH_SILENCE_DEPRECATION_WARNING=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/francisco/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/francisco/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/francisco/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/francisco/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Root setup
source /usr/local/root_install/bin/thisroot.sh
