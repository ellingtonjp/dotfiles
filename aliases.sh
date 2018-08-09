alias be='bundle exec'

alias szrc='source ~/.zshrc'
alias sbrc='source ~/.bashrc'
alias vali='vim ~/.aliases'
alias vvrc='vim ~/.vimrc'
alias vzrc='vim ~/.zshrc'

alias ls="ls --color --group-directories-first"
alias l='ls -lA'
alias ll='ls -l'
alias la='ls -A'

# Grepping
alias gg='git grep'

# Moving around
alias cdf='cd ~/.files'

function _git_rebase_other_branch() {
  curr_branch=$(git rev-parse --abbrev-ref HEAD)
  git checkout $1
  git pull --rebase origin master
  git checkout $curr_branch
}

alias grbo=_git_rebase_other_branch
