# dotfilesの設定
sudo rm -rf $HOME/.zshrc
cp $HOME/ubuntu_setup/.zshrc $HOME/.zshrc
cp $HOME/ubuntu_setup/.gitconfig $HOME/.gitconfig
cp $HOME/ubuntu_setup/.vimrc $HOME/.vimrc
cp $HOME/ubuntu_setup/.tmux.conf $HOME/.tmux.conf

# VimのDraculaテーマをインストール
mkdir -p $HOME/.vim/pack/themes/start
cd $HOME/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula

# lsdをインストール
sudo snap install lsd

# powerlevel10kのためにシェルを再起動
cd $HOME/
sudo rm -rf $HOME/ubuntu_setup
echo ""
echo ""
echo ""
echo "powerlevel10kの設定のため、3秒後にシェルを再起動します。"
echo "これで環境構築は終わりです。お疲れ様でした!!!"
echo ""
echo ""
echo ""
sleep 3
exec $SHELL -l
