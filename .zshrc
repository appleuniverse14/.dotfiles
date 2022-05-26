# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# --------------------------------------------------------------------
# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
# --------------------------------------------------------------------
setopt auto_pushd

# --------------------------------------------------------------------
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
# --------------------------------------------------------------------
setopt pushd_ignore_dups

# --------------------------------------------------------------------
# 拡張 glob を有効にする
# glob とはパス名にマッチするワイルドカードパターンのこと
# （たとえば `mv hoge.* ~/dir` における "*"）
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# どういう意味を持つかは `man zshexpn` の FILENAME GENERATION を参照
# --------------------------------------------------------------------
setopt extended_glob

# --------------------------------------------------------------------
# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
# --------------------------------------------------------------------
setopt hist_ignore_all_dups

# --------------------------------------------------------------------
# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
# --------------------------------------------------------------------
setopt hist_ignore_all_dups
# historyの共有
setopt sharehistory
zstyle ':completion:*:default' menu select=1

# 大文字小文字に関わらず, 候補が見つからない時のみ文字種を無視した補完をする
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
/usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# コマンドのスペルを訂正
setopt correct

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# --------------------------------------------------------------------
# 環境変数
# --------------------------------------------------------------------
export LANG=ja_JP.UTF-8
LS_COLORS='di=34:fi=0:ln=33:pi=5:so=5:bd=5:cd=5:or=0101:mi=0:ex=35:*.rpm=90'
export LS_COLORS
PATH="$PATH:$HOME/.cargo/bin"
export CC=/usr/bin/clang-14
export CXX=/usr/bin/clang++-14
# --------------------------------------------------------------------
# alias
# --------------------------------------------------------------------
alias ls='lsd'
alias la='ls -laF'
alias ll='ls -l'
alias lla='ll -A'
alias g++='g++ -std=c++17 -Wall -Wextra -Wconversion -pedantic'
alias gcc='gcc -std=c99 -Wall -Wextra'
alias relogin='exec $SHELL -l'
alias dirs='dirs -v'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias v='nvim'
# --------------------------------------------------------------------
# その他
# --------------------------------------------------------------------
gitacp() {
    git add -A
    git commit -m "$*"
    git push origin HEAD
}

function gcc2(){
    FILENAME=$(basename $1);
    CFILE=$(basename $1 .c);
    gcc -o $CFILE -ansi -pedantic -Wall -Wextra -g3 -std=c11 $FILENAME -lm -lpulse -lpulse-simple;
}
# alias gcc=gcc2

function g++2(){
    FILENAME=$(basename $1);
    CFILE=$(basename $1 .cpp);
    g++ -o $CFILE -ansi -pedantic -Wall -Wextra -g3 $FILENAME -lm;
}
# alias g++=g++2

# 端末起動時にtmuxセッションを開始
if [[ ! -n $TMUX ]]; then
  tmux new-session
fi

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
