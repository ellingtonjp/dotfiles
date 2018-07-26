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
LOCAL=$(cd $DOTFILES && git rev-parse @{0})
REMOTE=$(cd $DOTFILES && git rev-parse "$UPSTREAM")
BASE=$(cd $DOTFILES && git merge-base @{0} "$UPSTREAM")

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
