export ZSH="/home/dmitriy/.oh-my-zsh"

ZSH_THEME="dracula"

plugins=(
  git
  bundler
)

source $ZSH/oh-my-zsh.sh

alias be='bundle exec'

export EDITOR='vim'
