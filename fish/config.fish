if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
export EDITOR="hx"
export SHELL="/bin/fish"
export TERM="xterm-256color"
fish_vi_key_bindings
fzf --fish | source

alias fd="fdfind"
alias bat="batcat"
alias la="eza -la --git"

zoxide init fish | source

thefuck --alias | source
