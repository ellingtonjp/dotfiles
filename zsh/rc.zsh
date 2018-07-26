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


function _yes() {
  echo $fg[red]$1
  read line
  if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
    return 0
  else
    return 1
  fi
}

UPSTREAM=${1:-'@{u}'}
LOCAL=$(cd $DOTFILES && git rev-parse @)
REMOTE=$(cd $DOTFILES && git rev-parse "$UPSTREAM")
BASE=$(cd $DOTFILES && git merge-base @ "$UPSTREAM")

echo
if ! (cd $DOTFILES && git diff-index --quiet HEAD --); then
  echo $fg[red]"Dotfiles: uncommitted local changes."
elif [ $LOCAL = $REMOTE ]; then
  echo $fg[green]"Dotfiles: up-to-date"
elif [ $LOCAL = $BASE ]; then
  if (_yes "Dotfiles: upstream changes. Rebase?"); then
    cd $DOTFILES && gup
  fi
elif [ $REMOTE = $BASE ]; then
  if (_yes "Dotfiles: local changes haven't been pushed. Push?"); then
    cd $DOTFILES && gp
  fi
else
  if (_yes "Dotfiles: upstream and local have diverged. Rebase then push?"); then
    cd $DOTFILES && gup && gp
  fi
fi
