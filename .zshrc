[[ $- != *i* ]] && return

SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zhist
PROMPT="%F{2}%m%f:%F{4}%1~%f%# "
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

autoload -Uz compinit && compinit
zstyle ":completion:*" menu yes select
zstyle ":completion:*" special-dirs true
zstyle ":completion::complete:*" gain-privileges 1
setopt no_case_glob no_case_match hist_ignore_dups inc_append_history
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
alias vim="nvim"
