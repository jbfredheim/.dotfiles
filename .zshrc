if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

__conda_setup="$('/Users/joachim/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joachim/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joachim/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joachim/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export VISUAL="nvim"

alias ls="ls -la"
alias l="ls -la"
alias v=nvim
alias vim=nvim
alias s="source ~/.zshrc"
alias con="cd $XDG_CONFIG_HOME"
alias vcon="nvim $XDG_CONFIG_HOME"
alias vc="nvim $XDG_CONFIG_HOME"
alias vz="nvim ~/.zshrc"
alias dev="cd ~/dev"
alias auge="cd ~/dev/auge/"
alias c=clear

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
