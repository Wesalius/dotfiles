# /etc/bash.bashrc

#ALIASES
##################################################
alias top="htop"
alias avahi="sudo avahi-daemon;avahi-discover;"
alias avahid="sudo avahi-daemon &"
alias avahib="avahi-discover"
alias ..="cd .."
alias ....="cd ../.."
alias c="clear"
alias cp="cp -iv"
alias m="cvlc /home/zef/audio/music/singly/*.ogg"
alias diff="colordiff"
alias df="df -h"
alias dir="dir --color=auto"
alias du="du -c -h"
alias ff="firefox &"
alias find="find -name"
alias g="sudo geany"
alias ga="git add"
alias gcl="git clone"
alias gs="git status"
alias gp="git pull --all"
alias grep="grep --color=auto"
alias h="history"
alias 000="chmod 000"
alias 644="chmod 644"
alias 755="chmod 755"
alias date="date --iso-8601"
alias ls="ls --color=auto"
alias ls.="ls -d .* --color=auto"
alias ll="ls -la"
alias google="lynx http://google.com"
alias path="readlink -f"
alias n="sudo nano"
alias bashrc="sudo nano /etc/bash.bashrc"
alias pgrep="pgrep -lu"
alias ping="ping -c 5"
alias py="python"
alias pwb="python pwb.py"
alias ccrc="cd core;python pwb.py cosmetic_changes -recentchanges;cd .."
alias ccnp="cd core;python pwb.py cosmetic_changes -newpages:1000;cd .."
alias reddir="cd core;python pwb.py redirect double -always;cd .."
alias 2red="cd core;python pwb.py redirect double -always;cd .."
alias off="sudo shutdown now"
alias gerrit="ssh -p 29418 zef@gerrit.wikimedia.org"
alias tools="ssh login.tools.wmflabs.org"
alias speed="speedometer -r wlp4s0 -t wlp4s0"
alias sub="subliminal download -l en"
alias root="sudo su"
alias boincs="systemctl start boinc.service"
alias dict="sdcv"
alias count="wc -l"
alias wifi="sudo wifi-menu"
alias mv="mv -iv"
alias towd="mv -iv user-config.py wd-user-config.py"
alias fromwd="mv -iv user-config.py wd-user-config.py"
alias towi="mv -iv user-config.py wi-user-config.py"
alias fromwi="mv -iv wi-user-config.py user-config.py"
alias tows="mv -iv user-config.py ws-user-config.py"
alias fromws="mv -iv ws-user-config.py user-config.py"
alias unmount="umount"
alias xclip="xclip -selection clipboard"
alias o="xdg-open"
alias y="yaourt"
alias y="sudo yaourt"
alias r="sudo yaourt -R"
alias uns="sudo yaourt -Rs"
alias r="yaourt -Rs"
alias i="yaourt -S --noconfirm"
alias s="yaourt -S"
alias up="yaourt -Syu --aur"
alias yt="youtube-dl"
alias upnc="yaourt -Syu --aur --noconfirm"

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


#back up a file; usage "bu filename.txt" 
bu () { cp $1 ${1}-"date +%Y%m%d%H%M".backup ; }

set completion-ignore-case on
