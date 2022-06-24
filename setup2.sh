# dotfilesの設定
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/.vimrc $HOME/.vimrc
rm -rf $HOME/.config/nvim
ln -sf $HOME/.dotfiles/nvim $HOME/.config
ln -sf $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
# powerlevel10kのためにシェルを再起動
sleep 1
exec $SHELL -l
