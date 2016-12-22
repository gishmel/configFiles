source /usr/share/zsh/site-contrib/powerline.zsh
zstyle ':completion:*' menu select
export PATH=~/.npm-global/bin:$PATH
HISTSIZE=4000
SAVEHIST=4000
HISTFILE=~/.zsh_history
bindkey -v
bindkey '^R' history-incremental-search-backward
ZSH_THEME="random"
# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT
# allows you to type Bash style comments on command line
setopt interactivecomments
# Zsh has a spelling corrector
setopt CORRECT
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# ooh, what is this?! Completions thank you!
source ~/.oh-my-zsh/lib/completion.zsh
