HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

# Quicker Vi-mode switch
export KEYTIMEOUT=1

# Auto-completion
autoload -Uz compinit
compinit

# Prompt
fpath+=("$HOME/.config/pure")
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=">"
PURE_GIT_DOWN_ARROW="↓"
PURE_GIT_UP_ARROW="↑"
prompt pure

zstyle :compinstall filename "$HOME/.zshrc"

#eval $(dircolors ~/.dircolors)
# Use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

fpath=("$HOME/.zfunctions" $fpath)

alias ls='ls --quoting-style=literal --color=auto'
alias cp='cp -v'
alias mv='mv -v'
alias t="todo.sh -P" #todo.txt

#FZF
#. /usr/share/fzf/key-bindings.zsh

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word 
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line

# Change cursor type for current mode
function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor
      viins|main) print -n '\033[5 q';; # line cursor
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
