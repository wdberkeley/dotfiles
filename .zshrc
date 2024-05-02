# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sorin"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export EDITOR=vim

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases.
alias python="python3"
alias vim="nvim"
alias ll='ls -AFhl'
