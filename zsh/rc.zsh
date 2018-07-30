export DOTFILES=$HOME/.files

export ZGEN_DIR=$DOTFILES/zsh/zgen
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
source "${DOTFILES}/zsh/zgen/zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh themes/cypher

  zgen load zlsun/solarized-man
  zgen load djui/alias-tips
  zgen load johnhamelink/rvm-zsh
  zgen load hcgraf/zsh-sudo

  zgen load zsh-users/zsh-autosuggestions

  zgen load zsh-users/zsh-completions src
  zgen load hlissner/zsh-autopair
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

source ~/.aliases

if [[ "$(hostname)" = "sf104.meraki.com" ]]; then
  export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45/bin
  export PATH="$JAVA_HOME:$PATH"
  source ~/perl5/perlbrew/etc/bashrc
fi
