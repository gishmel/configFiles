#
# ~/.bash_profile
#

if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
