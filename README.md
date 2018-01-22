# dotfiles

##Install
```
git clone https://github.com/ellingtonjp/dotfiles ~/.files

ln -s ~/.files/.bash_aliases ~
ln -s ~/.files/.bash_profile ~
ln -s ~/.files/.bashrc ~
ln -s ~/.files/.tmux.conf ~

# Choose light/dark dircolors
ln -s ~/.files/.dir_colors_dark ~/.dircolors

# Install vim
ln -s ~/.files/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
```
