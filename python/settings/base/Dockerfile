# ベースイメージ名:タグ名
FROM continuumio/anaconda3:2020.02

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

# pipをアップグレードし必要なパッケージをインストール
RUN pip install --upgrade pip && \
    pip install janome && \
    pip install transformers && \
    Pip install jsonlines

# MeCabのインストール
RUN git clone https://github.com/taku910/mecab && \
    cd mecab/mecab && \
    ./configure --enable-utf8-only && \
    make && \
    make check && \
    make install && \
    pip install --no-cache-dir mecab-python3 && \
    ldconfig && \
    cd ../mecab-ipadic && \
    ./configure --with-charset=utf8 && \
    make && \
    make install

# データ解析に必要なパッケージのインストール
RUN conda install beautifulsoup4 && \
    conda install tensorflow h5py && \
    conda install -c conda-forge tensorboard && \
    conda install -c anaconda gensim

# CUIアプリのインストール
RUN conda install -c conda-forge go-ghq && \
    conda install -c conda-forge tmux && \
    apt install peco