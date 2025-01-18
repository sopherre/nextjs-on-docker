# ベースイメージとしてNode.jsを使用
FROM node:18-alpine

# Gitをインストール
RUN apk add --no-cache git

# 作業ディレクトリを設定
WORKDIR /app

# package.jsonとpackage-lock.jsonをコピー
COPY package*.json ./

# 必要なパッケージをインストール
RUN npm install

# プロジェクトファイルをコピー
COPY . .

# 開発用のポートを公開
EXPOSE 3000

# 開発モードでNext.jsを実行
CMD ["npm", "run", "dev"]