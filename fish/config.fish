if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
alias v="nvim"

export EDITOR="hx"
export SHELL="/bin/fish"

function fish_mode_prompt
end
export TERM="xterm-256color"
fish_vi_key_bindings
alias gt="git log --all --topo-order --graph --show-signature"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gs="git status"
alias gd="git diff"
fzf --fish | source
