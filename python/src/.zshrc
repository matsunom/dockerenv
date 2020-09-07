# 日本語入力に対応
export LANG=ja_JP.UTF-8
# set color
autoload -U colors
colors

# user prompt
## 左側のプロンプト
PROMPT='[%F{yellow}%T%f %F{cyan}%U%m%u%f]# '
## 右側のプロンプト
RPROMPT='[%F{magenta}%n%f:%F{green}%(5~,%-2~/.../%2~,%d)%f]'

# 補完機能を有効にする
autoload -U compinit
compinit

# メニュー補完絞り込み
zstyle ':completion:*:default' menu select interactive
setopt menu_complete

# 補完候補に色を付ける
# if [ -n "$LS_COLORS" ]; then
#     zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# fi

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

#入力ミスに対応する。
setopt correct
 
#直前のコマンドと同じなら、履歴に残さない
setopt HIST_IGNORE_DUPS
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/usr/local/Homebrew/opt/ncurses/bin:$PATH"
