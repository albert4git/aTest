Multi-line Prompt

Most terminals are 80 characters wide, so you run out of room when you have a long prompt. So why not break up the lines? You can with our old friend the newline special character, \n:

PS1='\[\e[1;33m\]\u@\h \w ->\n\[\e[1;36m\] \@ \d\$\[\e[m\] '

This creates a nice prompt with the username, current directory, and time and date (figure 4). It has an arrow to indicate there is another line, and it terminates in a proper dollar sign for an unprivileged user.

fig-4 multiline
Root Prompt

The root prompt is indicated by the hash mark, #. As long as we're making fancy prompts, why not make one for the root user too? Add these lines to both your ~/.bashrc, and to root's/root/.bashrc:

if [ $(id -u) -eq 0 ];
then
    PS1='\[\e[1;36m\][\d \t \u@\h \w]\$\[\e[m\] '
else
    PS1='\[\e[1;33m\][\d \t \u@\h \w]\$\[\e[m\] '
fi

You can either sudo or su to root, then source ~/.bashrc, and enjoy root's new fancy prompt. You can fancy up root's prompt just like for any user. A quick way to check any user's ID number is with the ID command:

$ id -u
=============================================
dpkg-reconfigure console-setup
=============================================

You can also dynamically change the font size after the system has booted.

The simplest way I've found is to pick a font that you like from /usr/share/consolefonts/ and pass it to the setfont command. Not all the fonts work for me (some say 'KDFONTOP: invalid argument', possibly due to my framebuffer settings), but enough do. If you want a large font, I'd suggest trying either of these commands to start with:

/usr/share/consolefonts/ 
setfont Uni2-Terminus16
setfont Uni2-Fixed18

vi /etc/default/console-setup

ACTIVE_CONSOLES="/dev/tty[1-6]"
CHARMAP="UTF-8"
CODESET="guess"
FONTFACE="TerminusBold"
FONTSIZE="16x32"
SCREEN_WIDTH="80"


If you want to make your choice persist through reboots, you'll need to add a command somewhere in your startup scripts. (.bashrc will work, but you should probably try to think of somewhere better.)

The other way is to use the console-setup package. Type

sudo dpkg-reconfigure console-setup

https://www.maketecheasier.com/change-console-fonts-in-ubuntu/
################################################################################:w



# CLI colors
export CLICOLOR=true
# a black
# b red
# c green
# d brown
# e blue
# f magenta
# g cyan
# h light grey
# A bold black, usually shows up as dark grey
# B bold red
# C bold green
# D bold brown, usually shows up as yellow
# E bold blue
# F bold magenta
# G bold cyan
colorize_prompt() {
  colorize $@ &>/dev/null

  if [ "$color_support" = true ]
  then
    text="\[\e[$style$color$background\]$1\[\e[0m\]"
  fi

  echo $text
}

# Main prompt
PS1="$(colorize_prompt "火" purple bold) $(colorize_prompt "\w" blue bold) "

# Continuation prompt
PS2="$(colorize_prompt "|" cyan bold) "

####################################################################################

# H bold light grey; looks like bright white
# x default foreground or background
# Order: dir - symlink - socket - pipe - exec - block special - char special - exec setuid - exec setgid - public dir sticky bit - public dir no sticky bit
export LSCOLORS='exfxcxdxbxegedabagacad'

#Prompt and prompt colors
# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# 0 - Normal
# 1 - Bold

#######################################################################################

function exitstatus {
LS_COLORS='fi=0:ln=5:pi=0:so=7:bd=5:cd=5:or=31:mi=0:ex=93:*.py=36:di=40:*.zip=33:*.tgz=33:ow=0'



    EXITSTATUS="$?"
    BOLD="\[\033[1m\]"
    RED="\[\033[4;31m\]"
    GREEN="\[\e[32;1m\]"
    BLUE="\[\e[34;1m\]"
    OFF="\[\033[m\]"

    PROMPT="[\u@\h ${BLUE}\W${OFF}"

    if [ "${EXITSTATUS}" -eq 0 ]
    then
       PS1="${PROMPT} ${BOLD}${GREEN}:)${OFF} ]\$ "
    else
       PS1="${PROMPT} ${BOLD}${RED}:(${OFF} ]\$ "
    fi

    PS2="${BOLD}>${OFF} "
}

PROMPT_COMMAND=exitstatus
#######################################################################################
#
  if [ -n "$COLORTERM" ]; then
      alias ls='ls -F --color=auto'
      if [ -x "`which dircolors`" -a -r "$HOME/.dir_colors" ]; then
          eval `dircolors -b "$HOME/.dir_colors"`
      fi
  else
      alias ls='ls -F'
  fi



function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[4;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[4;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[4;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[4;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[4;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[4;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[4;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[4;37m\]"
export PS1="\n\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}$BLACKBOLD[\t]$PURPLEBOLD \u@\h\[\033[00m\]:$BLUEBOLD\w\[\033[00m\] \\$ "
}

prompt



function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
export PS1="\n\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}$BLACKBOLD[\t]$PURPLEBOLD \u@\h\[\033[00m\]:$BLUEBOLD\w\[\033[00m\] \\$ "
}

prompt


#############################################################################
function __setprompt
{
  local LAST_COMMAND=$? # Must come first!

# Define colors
    local LIGHTGRAY="\033[0;37m"
    local WHITE="\033[1;37m"
    local BLACK="\033[0;30m"
    local DARKGRAY="\033[1;30m"
    local RED="\033[0;31m"
    local LIGHTRED="\033[1;31m"
    local GREEN="\033[0;32m"
    local LIGHTGREEN="\033[1;32m"
    local BROWN="\033[0;33m"
    local YELLOW="\033[1;33m"
    local BLUE="\033[0;34m"
    local LIGHTBLUE="\033[1;34m"
    local MAGENTA="\033[0;35m"
    local LIGHTMAGENTA="\033[1;35m"
    local CYAN="\033[0;36m"
    local LIGHTCYAN="\033[1;36m"
    local NOCOLOR="\033[0m"

# Show error exit code if there is one
    if [[ $LAST_COMMAND != 0 ]]; then
      PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
#PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
        if [[ $LAST_COMMAND == 1 ]]; then
          PS1+="General error"
            elif [ $LAST_COMMAND == 2 ]; then
            PS1+="Missing keyword, command, or permission problem"
            elif [ $LAST_COMMAND == 126 ]; then
            PS1+="Permission problem or command is not an executable"
            elif [ $LAST_COMMAND == 127 ]; then
            PS1+="Command not found"
            elif [ $LAST_COMMAND == 128 ]; then
            PS1+="Invalid argument to exit"
            elif [ $LAST_COMMAND == 129 ]; then
            PS1+="Fatal error signal 1"
            elif [ $LAST_COMMAND == 130 ]; then
            PS1+="Script terminated by Control-C"
            elif [ $LAST_COMMAND == 131 ]; then
            PS1+="Fatal error signal 3"
            elif [ $LAST_COMMAND == 132 ]; then
            PS1+="Fatal error signal 4"
            elif [ $LAST_COMMAND == 133 ]; then
            PS1+="Fatal error signal 5"
            elif [ $LAST_COMMAND == 134 ]; then
            PS1+="Fatal error signal 6"
            elif [ $LAST_COMMAND == 135 ]; then
            PS1+="Fatal error signal 7"
            elif [ $LAST_COMMAND == 136 ]; then
            PS1+="Fatal error signal 8"
            elif [ $LAST_COMMAND == 137 ]; then
            PS1+="Fatal error signal 9"
            elif [ $LAST_COMMAND -gt 255 ]; then
            PS1+="Exit status out of range"
        else
          PS1+="Unknown error code"
            fi
            PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
    else
      PS1=""
        fi

# Date
        PS1+="\[${DARKGRAY}\](\[${CYAN}\]\$(date +%a) $(date +%b-'%-m')" # Date
        PS1+="${BLUE} $(date +'%-I':%M:%S%P)\[${DARKGRAY}\])-" # Time

# CPU
        PS1+="(\[${MAGENTA}\]CPU $(cpu)%"

# Jobs
        PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]\j"

# Network Connections (for a server - comment out for non-server)
        PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]Net $(awk 'END {print NR}' /proc/net/tcp)"

        PS1+="\[${DARKGRAY}\])-"

# User and server
        local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
        local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
        if [ $SSH2_IP ] || [ $SSH_IP ] ; then
          PS1+="(\[${RED}\]\u@\h"
        else
          PS1+="(\[${RED}\]\u"
            fi

# Current directory
            PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\])-"

# Total size of files in current directory
            PS1+="(\[${GREEN}\]$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')\[${DARKGRAY}\]:"

# Number of files
            PS1+="\[${GREEN}\]\$(/bin/ls -A -1 | /usr/bin/wc -l)\[${DARKGRAY}\])"

# Skip to the next line
            PS1+="\n"

            if [[ $EUID -ne 0 ]]; then
              PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
            else
              PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
                fi

# PS2 is used to continue a command using the \ character
                PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

# PS3 is used to enter a number choice in a script
                PS3='Please enter a number from above list: '

# PS4 is used for tracing a script in debug mode
                PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'
#
#######################################################################
