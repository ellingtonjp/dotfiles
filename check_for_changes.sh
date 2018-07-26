#!/usr/bin/env zsh

function _yes() {
  echo $fg[red]$1
  read line
  if [[ "$line" == Y* ]] || [[ "$line" == y* ]]; then
    return 0
  else
    return 1
  fi
}

function _check_for_changes() {
  cd $DOTFILES && git fetch

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
    echo $fg[red]"Dotfiles: upstream changes, need to rebase."
    # if (_yes "Dotfiles: upstream changes. Rebase? [y/N]"); then
    #   cd $DOTFILES && git pull --rebase
    # fi
  elif [ $REMOTE = $BASE ]; then
    echo $fg[red]"Dotfiles: local changes need to be pushed."
    # if (_yes "Dotfiles: local changes haven't been pushed. Push? [y/N]"); then
    #   cd $DOTFILES && git push
    # fi
  else
    echo $fg[red]"Dotfiles: upstream and local have diverged. Rebase then push."
    # if (_yes "Dotfiles: upstream and local have diverged. Rebase then push? [y/N]"); then
    #   cd $DOTFILES && git pull --rebase && git push
    # fi
  fi
}

_check_for_changes
