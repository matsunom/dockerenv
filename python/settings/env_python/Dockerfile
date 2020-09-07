# ベースイメージ名:タグ名
FROM base_python:1.3

# zshの設定
RUN { \
    echo "# set color"; \
    echo "autoload -U colors"; \
    echo "colors"; \
    echo "# user prompt"; \
    echo "## 左側のプロンプト" \
    echo "PROMPT='[%F{yellow}%T%f %F{cyan}%U%m%u%f]# '"; \
    echo "## 右側のプロンプト"; \
    echo "RPROMPT='[%F{magenta}%n%f:%F{green}%(5~,%-2~/.../%2~,%d)%f]'"; \
    echo "# 補完機能を有効にする"; \
    echo "autoload -U compinit"; \
    echo "compinit"; \
    echo "# メニュー補完絞り込み"; \
    echo "zstyle ':completion:*:default' menu select interactive"; \
    echo "setopt menu_complete"; \
    echo "# セパレータを設定する"; \
    echo "zstyle ':completion:*' list-separator '-->'"; \
    echo "zstyle ':completion:*:manuals' separate-sections true"; \
    echo "#入力ミスに対応する"; \
    echo "setopt correct"; \
    echo "#直前のコマンドと同じなら、履歴に残さない"; \
    echo "setopt HIST_IGNORE_DUPS"; \
    } >> ~/.zshrc

# 作業ディレクトリ
WORKDIR /root
ENTRYPOINT [ "/bin/zsh" ]