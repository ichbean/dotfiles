# Default applications
export EDITOR="nvim"
export BROWSER="firefox"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/aleksei/.zshrc'

eval $(dircolors ~/.dircolors)
# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit && compinit
autoload -U promptinit && promptinit
PURE_PROMPT_SYMBOL=">"
prompt pure

fpath=( "$HOME/.zfunctions" $fpath )

alias ls='ls --color=auto '
alias cp='cp -v '
alias install='sudo pacman -S '
alias aur='pacaur -y '
alias upgrade='sudo pacman -Syu && pacaur -u'
alias search='pacaur -Ss '
alias remove='sudo pacman -Rs '
#todo.txt
alias t="todo.sh -P"
export TODOTXT_DEFAULT_ACTION=ls

#FZF
export FZF_DEFAULT_COMMAND='find .'
. /etc/profile.d/fzf.zsh
