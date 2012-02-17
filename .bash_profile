[ -z "$PS1" ] && return

# OPTIONS
export HISTCONTROL=ignoredups
# ALIASES
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias lsal='ls -al'
alias grepp='grep -EHnr'
alias bashrc='vi ~/.bash_profile && source ~/.bash_profile'
alias vimrc='vi ~/../tools/Vim/_vimrc'

# PATHS
export DEV=~/Development
export PROJECTS=$DEV/Projects
# tools
export RVM_HOME=~/.rvm
export PATH=${RVM_HOME}/bin:/Applications:${PATH}

# FUNCTIONS
cpg (){
	if [ -d "$2" ];then
		cp $1 $2 && cd $2
	else
		cp $1 $2
	fi
}

mvg (){
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}

source $HOME/Bash-Git-Prompt/git_remote_check.sh
source $HOME/Bash-Git-Prompt/git_prompt.sh
