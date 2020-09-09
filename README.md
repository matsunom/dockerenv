# dockerenv
Docker上の各言語の開発環境。


## python
- zshが使えるAnaconda3環境
- jupyter-Lab環境

`# イメージの作成`

`cd python`

`docker image build -t base_python:1.3 ./settings/base/`

`# コンテナの起動`

`docker-compose up`

## node.js
- node.js環境
- Notionを使ったブログ作成ツールbotablogの環境

`# イメージの作成`

`cd nodejs`

`docker image build -t base_nodejs:1.0 ./settings/base/`

`# コンテナの起動(初回)`

`docker-compose up --build`

`# コンテナの起動(2回目から)`

`docker-compose up --build`
