# zshrcの設定ファイル

PATH=$PATH:/opt/local/bin/      # Mac時のパス追加
export LANG=ja_JP.UTF-8


autoload -U compinit; compinit  # 補完機能をON
autoload -U colors; colors      # カラー表示をON


setopt auto_pushd               # cdコマンドだけでディレクトリスタックにpushedする
setopt auto_cd                  # ディレクトリ名を入力するだけで移動する
setopt correct
setopt cdable_vars              # 絶対パスが入った変数をディレクトリとみなす
setopt noclobber                # リダイレクトによる上書きを禁止
setopt extendedglob             # 拡張ファイルグロブ ( ls ^*.c で「 *.c以外にマッチ」等が使用可能に)
setopt listpacked               # 補完候補を出来るだけ詰めて表示
setopt listtypes                # 補完候補の表示が、/ならディレクトリ、@がシンボリックなどと親切表示
setopt listrowsfirst            # 補完候補の表示が水平方向にソートされた順になる


# 大文字小文字を区別しない（大文字->小文字は無い）
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# +++ vimライクなコマンド入力 +++
bindkey -v


# +++ historyコマンドの設定 +++
HISTFILE=~/.zhistory   # zsh終了後に書き込まれるhistory履歴
SAVEHIST=10000         # history履歴保存数
setopt histnostore     # historyコマンドを履歴に残さない
setopt histignoredups  # 重複コマンドを履歴に残さない
setopt extendedhistory # 履歴ファイルの出力形式を「:実行時間:経過時間:コマンド」に


# +++ 左プロンプト +++ 
# (カラフル記号、ユーザ名@ドメイン名、カラフル記号、ディレクトリ情報、プロンプト終了記号)
PROMPT="%{${fg[red]}%}+%{${fg[yellow]}%}+%{${fg[blue]}%}+\
%{${fg[default]}%}%n%{${fg[red]}%}@%{${fg[default]}%}%m\
%{${fg[blue]}%}+%{${fg[yellow]}%}+%{${fg[red]}%}+\
%{${fg[default]}%} %{${fg[green]}%}%(3~,%-1~/.../%1~,%~) \
%{${fg[red]}%}%# %{${fg[default]}%}"


# +++ 右プロンプト +++
# (非推奨）
#RPROMPT="%{${fg[red]}%}%h %{${fg[green]}%}%D %{${fg[default]}%}%T"


# +++ エイリアス +++
alias ls='ls -G'               # Mac
# alias ls='ls --color=auto'       # Linux
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias sl='ls'
alias his='history'
alias e='exit'
alias v='vim'
alias sc='screen'
alias scr='screen -r'
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'
alias sz='source ~/.zshrc'
alias gitl='git log'
alias gitb='git branch'
alias gitc='git checkout'


# プライベートな設定項目を$HOME以下の別ファイルから読み込み
[ -f $HOME/.zshrc.private ] && source $HOME/.zshrc.private
