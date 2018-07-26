export DOTFILES=$HOME/.files # path to dotfiles installation
export ZSH=$DOTFILES/zsh/oh-my-zsh # path ot oh-my-zsh installation

ZSH_THEME="cypher"

ENABLE_CORRECTION="true" # suggest corrections for commands not found

plugins=( vi-mode git colored-man-pages )

source $ZSH/oh-my-zsh.sh

source ~/.aliases # this will override oh-my-zsh aliases

if [[ "$(hostname)" = "sf104.meraki.com" ]]; then
  export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45/bin # used for firmware
  export PATH="$JAVA_HOME:$PATH"
  source ~/perl5/perlbrew/etc/bashrc
fi

source $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # must be last thing sourced
source $DOTFILES/check_for_changes.sh
