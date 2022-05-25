echo ""
echo ""
echo "zshのインストールまでを行います。zshのインストール後、setup2.shを実行してください。"
echo ""
echo ""

# パスワード入力
read -sp "パスワードを入力してください: " PASSWORD

cd $HOME

yes | sudo apt update
yes | sudo apt upgrade

# パッケージのインストール
yes | sudo apt install zsh git wget vim-gtk neovim openssh-server tmux tree curl cargo python3-pip xsel xclip nodejs nodejs-dev node-gyp libssl1.0-dev fonts-ricty-diminished
yes | sudo apt install npm
cargo install lsd
pip3 install pynvim

# node.jsのインストール
sudo npm install n -g
sudo n lts
sudo apt purge nodejs npm
sudo npm install -g yarn

# その他リポジトリなどをインストール
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
# Google Chromeのインストール
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm -rf ./google-chrome-stable_current_amd64.deb
# VSCodeのインストール
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
sudo apt install ./vscode.deb

# デフォルトのログインシェルをzshに変更
echo $PASSWORD | chsh -s /bin/zsh
echo ""
echo ""
echo "まず、FiraCode Nerd Fontをnerdfonts.com/font-downloadsからダウンロードしてください。"
echo "次に、シェルをzshに変更します。そのために、パソコンを再起動してください。"
echo "パソコンを再起動したら、setup2.shを実行してください。"
echo ""
echo ""
