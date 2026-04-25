
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\W: '

export PATH="$HOME/.local/bin:$PATH"

export LS_COLORS="di=0;33"
export EDITOR=nvim

bind '"\e^?": backward-kill-word'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jp/.local/bin/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jp/.local/bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jp/.local/bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jp/.local/bin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
