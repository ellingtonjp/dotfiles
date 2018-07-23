# Force exec zsh on meraki machines
if [[ $HOSTNAME = *".meraki.com"* ]]; then
  exec zsh --login
fi

# Keeping in case its needed later

# if [ -f $HOME/.bashrc ]; then
#   source $HOME/.bashrc
# fi
#
# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
#
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
