###
# 開発環境
###
FROM node:18 as builder

# 作業ディレクトリを設定
WORKDIR /app

# 必要なシステムパッケージの更新
RUN apt-get update

# ロケールパッケージのインストール
RUN apt-get install -y --no-install-recommends locales

# 日本語フォントのインストール
RUN apt-get install -y --no-install-recommends fonts-noto-cjk

# 日本語入力システム Mozc のインストール
RUN apt-get install -y --no-install-recommends fcitx-mozc

# make のインストール
RUN apt-get install -y --no-install-recommends make

# キャッシュ削除でイメージサイズを最適化
RUN rm -rf /var/lib/apt/lists/*

# 日本語ロケールの設定
RUN locale-gen ja_JP.UTF-8 && \
  echo 'LANG=ja_JP.UTF-8' > /etc/default/locale && \
  echo 'LC_ALL=ja_JP.UTF-8' >> /etc/default/locale && \
  echo 'ja_JP.UTF-8 UTF-8' >> /etc/locale.gen && \
  dpkg-reconfigure --frontend=noninteractive locales

# 環境変数としてロケールを設定
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

# 必要なファイルをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install

# アプリケーションコードをコピー
COPY . ./app

# デフォルトのコマンドを設定
CMD ["npm", "run", "dev"]


###
# 本番環境
###
FROM node:18-alpine as production

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/ .

# デフォルトのコマンドを設定
CMD ["npm", "run", "start"]
