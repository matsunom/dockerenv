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

# pipをアップグレードし必要なパッケージをインストール
RUN pip install --upgrade pip && \
    pip install janome && \
    pip install transformers

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