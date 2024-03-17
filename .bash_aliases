[ $(cat /proc/$PPID/comm) = gnome-terminal- ] && stty -ixon erase ^H
alias grep='grep --color=auto'
if [ -n "$SSH_CLIENT" ]; then
  PS1="\[$(tput bold; tput setaf 6)\]\h"
else
  PS1="\[$(tput bold; tput setaf 2)\]pts/\l"
fi
PS1=$PS1"\[$(tput sgr0)\]:"
PS1=$PS1"\[$(tput bold; tput setaf 4)\]\w"
PS1=$PS1"\[$(tput sgr0)\]\$ "
