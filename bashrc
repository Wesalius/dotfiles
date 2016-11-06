#WELCOME SCREEN
##################################################
clear
echo -ne "Ahoj, $USER. Dnes je "; date +"%d.%m.%Y. Čas %T."
echo -ne "${WHITE}";

#ALIASES
##################################################
alias top="atop"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias c="clear"
alias diff="colordiff"
alias df="df -h"
alias dir="dir --color=auto"
alias du="du -c -h"
alias ff="firefox"
alias gbashrc="sudo geany /etc/bash.bashrc"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push -u origin master"
alias gs="git status"
alias grep="grep --color=auto"
alias h="history"
alias 000="chmod 000"
alias 644="chmod 644"
alias 644="chmod 644"
alias 755="chmod 755"
alias j="jobs -l"
alias ls="ls --color=auto"
alias ls.="ls -d .* --color=auto"
alias ll="ls -la"
alias google="lynx http://google.com"
alias mkdir="mkdir -pv"
alias n="sudo nano"
alias bashrc="sudo nano /etc/bash.bashrc"
alias r="pacman -Rs"
alias s="pacman -S"
alias ping="ping -c 5"
alias py="python"
alias pwb="python pwb.py"
alias off="sudo shutdown now"
alias tools="ssh login.tools.wmflabs.org"
alias root="sudo su"
alias count="wc -l"
alias copy="xclip -sel clip"
alias y="yaourt"
alias ins="yaourt -S --noconfirm"
alias up="yaourt -Syua"
alias upnoconfirm="yaourt -Syua --noconfirm"

#EXPORTS
##################################################
export VISUAL=nano
export EDITOR=nano

#FUNCTIONS
##################################################
#colorized manpages;usage same as man
man() {
env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
LESS_TERMCAP_md=$(printf "\e[1;31m") \
LESS_TERMCAP_me=$(printf "\e[0m") \
LESS_TERMCAP_se=$(printf "\e[0m") \
LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
LESS_TERMCAP_ue=$(printf "\e[0m") \
LESS_TERMCAP_us=$(printf "\e[1;32m") \
man "$@"
}
#finds directory sizes of current dir;usage:>dirsize
dirsize () {
  du -shx * .[a-zA-Z0-9_]* 2> /dev/null | egrep "^ *[0-9.]*[MG]" | sort -n > /tmp/list
  egrep "^ *[0-9.]*M" /tmp/list
  egrep "^ *[0-9.]*G" /tmp/list
  rm -rf /tmp/list
}

#mkdir and cd inside;usage:>mkcd newdir
mkcd() {
  if [ $# != 1 ]; then
    echo "Usage: mkcd <dir>"
  else
    mkdir -p $1 && cd $1
  fi
}

#rename all the files which contain uppercase letters to lowercase in the current folder;usage:>filestolower
function filestolower(){
  read -p "This will rename all the files and directories to lowercase in the current folder, continue? [y/n]: " letsdothis
  if [ "$letsdothis" = "y" ] || [ "$letsdothis" = "Y" ]; then
    for x in "ls"
      do
      skip=false
      if [ -d $x ]; then
	read -p ""$x" is a folder, rename it? [y/n]: " renamedir
	if [ "$renamedir" = "n" ] || [ "$renameDir" = "N" ]; then
	  skip=true
	fi
      fi
      if [ "$skip" == "false" ]; then
        lc="echo $x  | tr "[A-Z]" "[a-z]""
        if [ $lc != $x ]; then
          echo "renaming $x -> $lc"
          mv $x $lc
        fi
      fi
    done
  fi
}

#chown -R on file;usage:>grab file
grab() {
	sudo chown -R ${USER} ${1:-.}
}

#remindme;usage:>emindme 10m "omg, the pizza"
remindme() {
  if [[ "$#" -lt 2 ]]; then
    echo -e "Usage: remindme [time] "[message]""
    echo -e "Example: remindme 50s "check mail""
    echo -e "Example: remindme 10m "go to class""
    #exit 0 #not enough args
  fi
  if [[ "$#" -gt 2 ]]; then
    echo -e "Usage: remindme [time] "[message]""
    echo -e "Example: remindme 50s "check mail""
    echo -e "Example: remindme 10m "go to class""
    #exit 0 #more than enough args
  fi
  if  [[ "$#" == 2 ]]; then
    sleep $1 && notify-send -t 15000 "$2" & echo "Reminder set"
  fi
}


#calculator using awk;usage:>calc 34*2
calc(){ awk "BEGIN { print $*}"; }

#back up a file; usage "bu filename.txt" 
bu () { cp $1 ${1}-"date +%Y%m%d%H%M".backup ; }
