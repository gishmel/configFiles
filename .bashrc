#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
BROWSER=/usr/bin/google-chrome-stable
EDITOR=nvim
XDG_CONFIG_HOME=/home/gishmel/.config
XDG_DATA_HOME=/home/gishmel/.config/nvim/
PATH=/home/gishmel/.npm-global/bin:$PATH
jstagswith() {
	find . -type f -iregex ".*\.js$" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags
}

jstagswithout() {
	find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags
}
