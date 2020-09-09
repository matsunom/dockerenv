# ベースイメージ名:タグ名
FROM node:lts

# ロケール環境変数の設定
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# timezone setting
ENV TZ Asia/Tokyo
RUN apt-get update \
  && apt-get install -y tzdata \
  && rm -rf /var/lib/apt/lists/* \
  && echo "${TZ}" > /etc/timezone \
  && rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata

# zshのインストールと環境整備用パッケージのインストール
RUN apt-get update \
    && apt-get install -y zsh vim sed git man apt-utils

# 基本的なパッケージをインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        build-essential \
        curl \
        wget \
	    less \
        tree \ 
        rsync \
        zip \
        unzip  && \
   apt-get clean 

# 日本語入力に対応
RUN apt-get update \
    && apt-get install -y locales \
    && locale-gen ja_JP.UTF-8 \
    && echo "# 日本語入力に対応" >> ~/.zshrc \
    && echo "export LANG=ja_JP.UTF-8" >> ~/.zshrc


# zshの設定
RUN { \
    echo "# set color"; \
    echo "autoload -U colors"; \
    echo "colors"; \
    echo "# user prompt"; \
    echo "## 左側のプロンプト"; \
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