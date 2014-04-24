# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/erdeszt/.rvm/gems/jruby-1.7.3/bin:/home/erdeszt/.rvm/gems/jruby-1.7.3@global/bin:/home/erdeszt/.rvm/rubies/jruby-1.7.3/bin:/home/erdeszt/.rvm/bin:/home/erdeszt/programs/play:/home/erdeszt/programs/play:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/erdeszt/bin:/usr/local/java/jdk1.7.0_10/bin:/home/erdeszt/bin:/usr/local/java/jre1.7.0_10/bin:/home/erdeszt/.rvm/bin:/home/erdeszt/.cabal/bin

export EDITOR='vim'

if [ "$TMUX" = "" ]; then tmux -2; fi

alias e='subl . &'
alias grep='egrep'
alias la='ls -al'
alias cat='less'
alias ack='ack-grep'

source ~/tmuxinator.zsh
