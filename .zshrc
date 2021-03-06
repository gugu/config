# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

HISTCONTROL=replacedups
export HISTCONTROL
export HISTIGNORE="pwd:ls"
export LC_ALL=en_US.UTF-8
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
setopt beep notify append_history share_history autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gugu/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
prompt walters
alias idea="cat>>/home/gugu/thoughts"
# End of lines added by compinstall
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
export LS_COLORS
alias -s html=w3m
alias -s pm=vim
alias -s avi=cvlc
export EDITOR=vim
alias svnvd='svn diff --diff-cmd ~/bin/svnvimdiff'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ET='|& tail -n20'
alias -g EL='|& less -R'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

preexec() {                                                                                                                                                    
    title "%m :$1"                                                                                                                                             
}                                                                                                                                                              
                                                                                                                                                               
precmd() {
    title "%m"
}
                                                                                                                                                               
title() {
case $TERM in                                                                                                                                                  
    screen)                                                                                                                                                    
        print -Pn "\ek$1\e\\" # screen title (in ^A???)                                                                                                        
        print -Pn "\e_$1\e\\" # screen location                                                                                                                
    ;;                                                                                                                                                         
    xterm*|rxvt)                                                                                                                                               
        print -Pn "\e]2;$1\a" # plain xterm title                                                                                                              
    ;;                                                                                                                                                         
    esac                                                                                                                                                       
}                                                                                                                                                              
        

if ls -F --color=auto >&/dev/null; then
    alias ls="ls --color=auto -F"
else
    alias ls="ls -F"
fi
alias ll="ls -l"
alias l.='ls -d .[^.]*'
alias lsd='ls -ld *(-/DN)'
alias md='mkdir -p'
alias rd='rmdir'
alias cd..='cd ..'
alias ..='cd ..'
alias po='popd'
alias pu='pushd'
alias tsl="tail -f /var/log/syslog"
alias df="df -hT"
alias em="emacs -nw"
alias upconf="rsync -a rsync://dotsync.ru/gugu ~ && . ~/.zshrc"
alias apt-get="sudo apt-get"     # remove annoyingness
alias H="sudo shutdown -h now"
alias peoplenet="sudo pppd call peoplenet"
which fortune >& /dev/null
. ~/.profile
if [ $? = 0 ]; then fortune ~/.fortunes/zsh-fortune/zsh-fortunes; fi
which htop >& /dev/null
if [ $? = 0 ]; then alias top=htop; fi
