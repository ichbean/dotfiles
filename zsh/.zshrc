HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

export KEYTIMEOUT=1

zstyle :compinstall filename "$HOME/.zshrc"

eval $(dircolors ~/.dircolors)
# Use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit && compinit
autoload -U promptinit && promptinit
PURE_PROMPT_SYMBOL=">"
PURE_GIT_DOWN_ARROW="↓"
PURE_GIT_UP_ARROW="↑"
prompt pure

fpath=( "$HOME/.zfunctions" $fpath )

alias ls='ls --quoting-style=literal --color=auto'
alias cp='cp -v'
alias mv='mv -v'
alias install='pacaur -S'
alias upgrade='pacaur -Syu'
alias search='pacaur -Ss'
alias remove='sudo pacaur -Rs'
alias scan='scanimage --device niash:libusb:001:006 --format=tiff > '
#todo.txt
alias t="todo.sh -P"

#FZF
. /usr/share/fzf/key-bindings.zsh

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word 
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line


PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
