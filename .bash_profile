#
# ~/.bash_profile
#

if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
