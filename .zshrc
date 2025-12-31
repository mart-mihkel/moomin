[[ $- != *i* ]] && return

PROMPT="%F{4}%~%f "

autoload -Uz compinit && compinit

zstyle ":completion:*" menu yes select
zstyle ":completion:*" special-dirs true
zstyle ":completion::complete:*" gain-privileges 1

setopt no_case_glob no_case_match hist_ignore_dups inc_append_history

alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
