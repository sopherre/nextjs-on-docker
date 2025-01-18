# NextJS on Docker

## 前提条件

このリポジトリを使用するには、以下の条件を満たしている必要があります：

- **OS**: Mac での動作を想定しています。
- **エディタ**: VSCode を使用します。
- **拡張機能**: Dev Containers 拡張機能を利用します。
- **SSH キー**: GitHub に SSH キーでアクセスしている場合、SSH キーが `~/.ssh` に配置されていること。
- **ホスト上の必要アプリ**:
  - Docker がインストールされていること（`docker -v` を実行し、バージョン情報が表示されるか確認してください）。

## 目的

このリポジトリは、ホストマシン上の依存関係を最小限に抑え、Docker がインストールされていれば、Next.js / TypeScript を使用した開発をスムーズに開始できる環境を提供することを目的としています。

## アプリケーションの起動手順

1. **VSCode を開く**  
   リポジトリのルートフォルダを VSCode で開きます。

2. **Dev Container を起動**  
   キーボードショートカット `CMD + Shift + P` を押してコマンドパレットを開き、`Dev Containers: Reopen in Container` を選択します。

   - ※ コンテナが未起動の場合でも、自動的に起動されます。
   - Docker デーモンが起動していることを確認してください。

3. **ブラウザで確認**  
   開発用サーバーが起動すると、`http://localhost:3000` にアクセスすることで、アプリケーションのページを確認できます。

## 開発について

Dev Container が起動すると、VSCode 内で直接開発を行うことが可能です。  
ファイルの編集やパッケージのインストール、コンソール操作など、全てコンテナ内で実行されます。

## 注意点

- このリポジトリでは、依存パッケージのバージョンを全て `latest` と指定しています。
  - **メリット**: 最新機能やセキュリティアップデートを常に利用できます。
  - **デメリット**: 新しいバージョンによる互換性の問題や予期せぬエラーが発生する可能性があります。

安定性が必要な場合は、特定のバージョンを明示的に指定してください。

## トラブルシューティング

### Docker が起動しない場合

- Docker デーモンが起動していることを確認してください。
- 再起動しても問題が解決しない場合は、Docker のインストール状況を確認してください。
