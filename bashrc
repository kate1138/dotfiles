#bash prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#PS1="\[\e]0;\u@\h: \W\a\]\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\W\[\033[00m\]\$\[$(tput sgr0)\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] "
#https://stackoverflow.com/a/16715681

PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1="\[\e]0;\u@\h: \W\a\]\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\W\[\033[00m\]\$\[$(tput sgr0)\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] "


    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+="${Red}$EXIT ${RCol}"      # Add red if exit code non 0
    else
        PS1+="${Gre}$EXIT ${RCol}"
    fi

}

#PATH

export PATH="$PATH:/Users/kate/kafka/kafka_2.13-2.4.0/bin"

