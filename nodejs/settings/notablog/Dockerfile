# ベースイメージ名:タグ名
FROM base_env_nodejs:1.0

#notablogのインストール
RUN npm i -g notablog \
 && git clone https://github.com/dragonman225/notablog-starter.git

RUN cd /root/notablog-starter
COPY ./config.json /root/notablog-starter/config.json

ENTRYPOINT ["notablog", "generate", "/root/notablog-starter"]