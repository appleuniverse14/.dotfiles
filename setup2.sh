# dotfilesの設定
sudo rm -rf ~/.zshrc
git clone https://github.com/taizoyuasa/ubuntu_setup.git ~/ubuntu_setup
cp ~/ubuntu_setup/.zshrc ~/.zshrc
cp ~/ubuntu_setup/.gitconfig ~/.gitconfig
cp ~/ubuntu_setup/.vimrc ~/.vimrc
sudo rm -rf ~/ubuntu_setup

# powerlevel10k
echo ""
echo ""
echo ""
echo "powerlevel10kの設定のため、Firacode Nerd fontをnerdfonts.com/font-downloadsからインストールしてください。"
echo "フォントのインストールが完了したら、シェルを再起動してください。"
echo ""
echo ""
echo ""

# 残り手動でやること