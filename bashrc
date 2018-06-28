#ALIASES
##################################################
alias ....='cd ../..'
alias ..='cd ..'
alias 000='chmod 000'
alias 2red='cd core;python pwb.py redirect double -always;cd ..'
alias 644='chmod 644'
alias 755='chmod 755'
alias +x='chmod +x'
alias avahi='sudo avahi-daemon;avahi-discover;'
alias avahib='avahi-discover'
alias avahid='sudo avahi-daemon &'
alias bashrc='sudo nano /etc/bash.bashrc'
alias c='clear'
alias ccnp='python3 pwb.py cosmetic_changes -newpages:1000;cd ..'
alias ccrc='python3 pwb.py cosmetic_changes -recentchanges;cd ..'
alias count='ls -1|wc -l'
alias core='cd /mnt/c/Users/wesalius/Desktop/wiki/core/'
alias wiki='cd /mnt/c/Users/wesalius/Desktop/wiki/'
alias cp='cp -iv'
alias cpwd='pwd|clip.exe'
alias date='date --iso-8601'
alias df='df -h'
alias diff='colordiff'
alias dir='dir --color=auto'
alias du='du -c -h'
alias ff='firefox &'
alias find='find -name'
alias fromwd='mv -iv user-config.py wd-user-config.py'
alias fromwi='mv -iv wi-user-config.py user-config.py'
alias fromws='mv -iv ws-user-config.py user-config.py'
alias ga='git add'
alias gcl='git clone'
alias gp='git pull --all'
alias grep='grep --color=auto'
alias h='history'
alias ins='sudo apt-get install'
alias ls='ls --color=auto'
alias mv='mv -iv'
alias n='sudo nano'
alias o='xdg-open'
alias off='sudo shutdown now'
alias path='readlink -f'
alias pgrep='pgrep -lu'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias pwb='python pwb.py'
alias py='python'
alias reddir='cd core;python pwb.py redirect double -always;cd ..'
alias rm='rm -i'
alias rem='sudo apt-get remove'
alias root='sudo su'
alias speed='speedtest-cli'
alias sub='subliminal download -l en'
alias tools='ssh login.tools.wmflabs.org'
alias top='htop'
alias towd='mv -iv user-config.py wd-user-config.py'
alias towi='mv -iv user-config.py wi-user-config.py'
alias tows='mv -iv user-config.py ws-user-config.py'
alias unmount='umount'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias wget='wget -c'
alias wifi='sudo wifi-menu'
alias xclip='xclip -selection clipboard'

#MEMORY ALIASES
##################################################
#get GPU ram on desktop / laptop
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
#pass options to free
alias meminfo='free -m -l -t'
#get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
#get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
#Get server cpu info
alias cpuinfo='lscpu'

#EXPORTS
##################################################
export VISUAL=nano
export EDITOR=nano

#FUNCTIONS
##################################################
#colorized manpages;usage same as man
man() {
env LESS_TERMCAP_mb=$(printf '\e[1;31m') \
LESS_TERMCAP_md=$(printf '\e[1;31m') \
LESS_TERMCAP_me=$(printf '\e[0m') \
LESS_TERMCAP_se=$(printf '\e[0m') \
LESS_TERMCAP_so=$(printf '\e[1;44;33m') \
LESS_TERMCAP_ue=$(printf '\e[0m') \
LESS_TERMCAP_us=$(printf '\e[1;32m') \
man '$@'
}
#finds directory sizes of current dir;usage:dirsize
dirsize () {
  du -shx * .[a-zA-Z0-9_]* 2> /dev/null | egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
  egrep '^ *[0-9.]*M' /tmp/list
  egrep '^ *[0-9.]*G' /tmp/list
  rm -rf /tmp/list
}

#rename all the files which contain uppercase letters to lowercase in the current folder;usage: filestolower
function filestolower(){
  read -p 'This will rename all the files and directories to lowercase in the current folder, continue? [y/n]: ' letsdothis
  if [ '$letsdothis' = 'y' ] || [ '$letsdothis' = 'Y' ]; then
    for x in 'ls'
      do
      skip=false
      if [ -d $x ]; then
	read -p ''$x' is a folder, rename it? [y/n]: ' renamedir
	if [ '$renamedir' = 'n' ] || [ '$renameDir' = 'N' ]; then
	  skip=true
	fi
      fi
      if [ '$skip' == 'false' ]; then
        lc='echo $x  | tr '[A-Z]' '[a-z]''
        if [ $lc != $x ]; then
          echo 'renaming $x -> $lc'
          mv $x $lc
        fi
      fi
    done
  fi
}

#chown -R on file;usage:grab file.txt
grab() {
	sudo chown -R ${USER} ${1:-.}
}

#remindme;usage:>remindme 10m 'omg, the pizza'
remindme() {
  if [[ '$#' -lt 2 ]]; then
    echo -e 'Usage: remindme [time] '[message]''
    echo -e 'Example: remindme 50s 'check mail''
    echo -e 'Example: remindme 10m 'go to class''
    #exit 0 #not enough args
  fi
  if [[ '$#' -gt 2 ]]; then
    echo -e 'Usage: remindme [time] '[message]''
    echo -e 'Example: remindme 50s 'check mail''
    echo -e 'Example: remindme 10m 'go to class''
    #exit 0 #more than enough args
  fi
  if  [[ '$#' == 2 ]]; then
    sleep $1 && notify-send -t 15000 '$2' & echo 'Reminder set'
  fi
}


#back up a file; usage 'bak filename.txt' 
bak () { cp $1 ${1}-'date +%Y%m%d%H%M'.backup ; }

set completion-ignore-case on

