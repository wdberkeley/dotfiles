# wdberkeley's .bashrc

# Shell options.
shopt -s checkwinsize # Check window size after each command.
shopt -s cmdhist      # Save multiline commands as one history entry.
shopt -s extglob      # Enable extended patterns.
shopt -s globstar     # Allow ** to match files and directories.
                      # Note that **/ matches directories only.
shopt -s histappend   # Append to history file instead of overwriting.

export EDITOR=vim

# Make it harder to clobber files.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias mkdir='mkdir -p'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias tree='tree -L 2 --filelimit 100'

# My favorite command.
alias ll='ls -AFhl'

# ls colors. macOS and Linux use different names.
# Cyan for directories because I can't see the blue very well.
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Colors for the prompt.
# From https://www.tldp.org/LDP/abs/html/sample-bashrc.html.
# They are all bold. See the original source for more choices.
BGreen='\[\e[1;32m\]'       # Green
BPurple='\[\e[1;35m\]'      # Purple
BWhite='\[\e[1;37m\]'       # White
NC='\[\e[m\]'               # Color Reset

# Prompt with git information, plus git completion.
source ~/.git-prompt.sh
source ~/.git-completion.sh
export PROMPT_COMMAND='__git_ps1 "$BGreen\w$NC$BPurple" "$NC $BWhite\\\$$NC "'
export GIT_PS1_SHOWDIRTYSTATE="yes"

# Rust.
# This is also managed with rustup.
export PATH="$HOME/.cargo/bin:$PATH" # Add rustup.rs installation to path.

# Go.
export PATH="/usr/local/go/bin:$PATH"
go env -w GOPATH="$HOME/src/go"

