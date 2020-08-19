export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(git)

source $ZSH/oh-my-zsh.sh


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Python bins, and ansible
export PATH="$PATH:$HOME/Library/Python/2.7/bin"

source ~/.iterm2_shell_integration.zsh

export POSTGRES_PASSWORD='foobar123'

# fxf autocomplete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ctags
alias ctags="`brew --prefix`/bin/ctags"
