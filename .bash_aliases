[ $(cat /proc/$PPID/comm) = fly-term ] && stty erase ^H
alias grep='grep --color=auto'
if [ -n "$SSH_CLIENT" ]; then
  PS1="\[$(tput bold; tput setaf 6)\]\h"
else
  PS1="\[$(tput bold; tput setaf 2)\]\h"
fi
PS1=$PS1"\[$(tput sgr0)\]:"
PS1=$PS1"\[$(tput bold; tput setaf 4)\]\w"
PS1=$PS1"\[$(tput sgr0)\]\$ "
