# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#ALIASES
##################################################
alias ..='cd ..'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'
alias +x='chmod +x'
alias ag='alias|grep'
alias arem='sudo apt-get remove && sudo apt autoremove'
alias bbashrc='cat ~/.bashrc > bashrc.txt && bak bashrc.txt && rm -f bashrc.txt'
alias bashrc='nano ~/.bashrc'
alias c='clear'
alias ccnp='python pwb.py cosmetic_changes -newpages:1000;cd ..'
alias ccrc='python pwb.py cosmetic_changes -recentchanges;cd ..'
alias cdiff='diff -wayd -W$(tput cols) --suppress-common-lines'
alias count='ls -1|wc -l'
alias cpwd='pwd|clip.exe'
alias date='date --iso-8601'
alias df='df -h'
alias diff='colordiff -y'
alias dir='dir --color=auto'
alias du='du -c -h'
alias e='explorer.exe `wslpath -w $PWD`'
alias eb='exec bash'
alias find='find -name'
alias fromwd='mv -iv user-config.py wd-user-config.py'
alias fromwi='mv -iv wi-user-config.py user-config.py'
alias fromws='mv -iv ws-user-config.py user-config.py'
alias gc='git clone'
alias gcom='git add -A && git commit'
alias gerrit='ssh -p 29418 zef@gerrit.wikimedia.org'
alias gp='git pull --all'
alias gpush='git push --all'
alias grep='grep --color=auto'
alias h='history'
alias hg='history|grep'
alias cht='cht.sh'
alias home='cd ~'
alias ins='sudo apt-get install'
alias l='less'
alias ll='ls -la'
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
alias py='python3'
alias python='python3'
alias rmdir='rm -r'
alias rnm='mmv'
alias root='sudo su'
alias sdiff='sdiff -w $(( $(tput cols) - 2 )) --suppress-common-lines'
alias speed='speedtest-cli'
alias sub='subliminal download -l en'
alias tools='ssh login.tools.wmflabs.org'
alias top='htop'
alias towd='mv -iv user-config.py wd-user-config.py'
alias towi='mv -iv user-config.py wi-user-config.py'
alias tows='mv -iv user-config.py ws-user-config.py'
alias unmount='umount'
alias upd='sudo apt-get update && sudo apt-get upgrade'
alias wikiectract='WikiExtractor.py --no-templates -ns ns1'
alias wget='wget -c'
alias wifi='sudo wifi-menu'
alias wsdump='wget http://www.wikiskripta.eu/WSdump2.gz && gzip -d WSdump2.gz'


#WTTR ALIASES
##################################################
alias brno='curl -4 http://wttr.in/Brno'
alias praha='curl -4 http://wttr.in/Praha'
alias jevicko='curl -4 http://wttr.in/Jevicko'
alias modrice='curl -4 http://wttr.in/Modrice'
alias vrbno='curl -4 http://wttr.in/Vrbno'


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
#finds directory sizes of current directory
function dirsize () {
  du -shx * .[a-zA-Z0-9_]* 2> /dev/null | egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
  egrep '^ *[0-9.]*M' /tmp/list
  egrep '^ *[0-9.]*G' /tmp/list
  rm -rf /tmp/list
}

#chown -R on file;usage:grab file
function grab() {
	sudo chown -R ${USER} ${1:-.}
}

#remindme;usage: remindme 10m 'omg, the pizza'
function remindme() {
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

function b2mb {
    local -i bytes=$1;
    if [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 )) Kb"
    else
        echo "$(( (bytes + 1048575)/1048576 )) Mb"
    fi
}

function mkdir {
    command mkdir $1 && cd $1
}

set completion-ignore-case on

export PATH=/bin:$PATH
