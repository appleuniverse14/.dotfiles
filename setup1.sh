echo "zshのインストールまでを行います。zshのインストール後、setup2.shを実行してください。"

# パスワード入力
read -sp "パスワードを入力してください: " password

yes | sudo apt update
yes | sudo apt upgrade

# パッケージのインストール
yes | sudo apt install zsh git vim neovim openssh-server tmux

# その他リポジトリなどをインストール
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh

# デフォルトのログインシェルをzshに変更
echo $password | chsh -s /bin/zsh
echo ""
echo "シェルをzshに変更します。そのために、パソコンを再起動してください。"