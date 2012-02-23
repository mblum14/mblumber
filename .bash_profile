[ -z "$PS1" ] && return

# OPTIONS
export HISTCONTROL=ignoredups

# ALIASES

# interactive
alias cp='cp -vi'
alias mv='mv -vi'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
 
# listings
alias lh='ls -lah'                # human readable (sizes) long and all ;-)
alias lls='ls -l -h -g -F'
alias lc='ls -aCF'
alias lsam='ls -am'               # List files horizontally
alias lr='ls -lR'                 # recursive
alias lsx='ls -ax'                # sort right to left rather then in columns
alias lss='ls -shAxSr'            # sort by size
alias lt='ls -lAtrh'              # sort by date and human readable
alias lm='ls -al |more'           # pipe through 'more'

# convenience
alias bash_profile='vi ~/.config/.bash_profile && source ~/.config/.bash_profile'
alias bashrc='vi ~/.config/.bashrc && source ~/.config/.bashrc'
alias vimrc='vi ~/.config/.gvimrc'

# PS1
export PS1="\[\033[33m\][\w]\n\033[35m\]\t\[\033[0m\] -> "

# PATHS
export DEV=~/Development
export PROJECTS=${DEV}/Projects

# TOOLS
export RVM_HOME=~/.rvm
export PATH=${RVM_HOME}/bin:/Applications:${PATH}

source $HOME/.config/Bash-Git-Prompt/git_remote_check.sh
source $HOME/.config/Bash-Git-Prompt/git_prompt.sh
