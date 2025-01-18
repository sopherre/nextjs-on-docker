FROM node:18-alpine

# SSHクライアントをインストール
RUN apk add --no-cache git openssh

# 作業ディレクトリを設定
WORKDIR /app

# 必要なファイルをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install

# アプリケーションコードをコピー
COPY . .

# 開発用ポートを公開
EXPOSE 3000

# 開発モードでNext.jsを実行
CMD ["npm", "run", "dev"]