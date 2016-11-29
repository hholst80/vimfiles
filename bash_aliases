alias g=git
alias d=docker
alias dm=docker-machine
alias dc=docker-compose
alias Unity=/opt/Unity/Editor/Unity
alias edit="gvim --remote-silent"

export EDITOR=vim
PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
