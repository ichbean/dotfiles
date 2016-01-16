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
PURE_GIT_DOWN_ARROW="↓"
PURE_GIT_UP_ARROW="↑"
prompt pure

fpath=( "$HOME/.zfunctions" $fpath )

alias ls='ls --color=auto '
alias cp='cp -v '
alias mv='mv -v '
alias install='sudo pacman -S '
alias aur='pacaur -y '
alias upgrade='sudo pacman -Syu && pacaur -u'
alias search='pacaur -Ss '
alias remove='sudo pacman -Rs '
#todo.txt
alias t="todo.sh -P"

#FZF
. /etc/profile.d/fzf.zsh
