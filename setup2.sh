# dotfilesの設定
sudo rm -rf ~/.zshrc
git clone https://github.com/taizoyuasa/ubuntu_setup.git ~/ubuntu_setup
cp ~/ubuntu_setup/.zshrc ~/.zshrc
cp ~/ubuntu_setup/.gitconfig ~/.gitconfig
cp ~/ubuntu_setup/.vimrc ~/.vimrc

# VimのDraculaテーマをインストール
mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula

# lsdをインストール
sudo snap install lsd

# powerlevel10kのためにシェルを再起動
cd ~/
sudo rm -rf ~/ubuntu_setup
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
