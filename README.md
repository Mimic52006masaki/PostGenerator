以下は、GitHubリポジトリ「PostGenerator」のREADME.mdファイルの修正版です。プロジェクトの概要、セットアップ手順、使用方法、ライセンス情報などを含んでいます。

---

# PostGenerator

PostGeneratorは、React（Vite）とRails APIを組み合わせたWebアプリケーションで、Dockerを使用して開発環境を簡単に構築できます。ユーザーが入力したURLをもとに、スクレイピング登録を行う機能を提供します。

## 🚀 特徴

* React（Vite）による高速なフロントエンド
* Rails 8 APIによるバックエンド
* PostgreSQL 15を使用したデータベース
* DockerとDocker Composeによる簡単な開発環境構築
* 複数のURLを一度に登録可能
* スクレイピング登録の成功時に投稿IDを取得し、詳細ページへ遷移可能

## 🛠 技術スタック

* フロントエンド: React + Vite
* バックエンド: Rails 8 API
* データベース: PostgreSQL 15
* コンテナ管理: Docker, Docker Compose

## 📦 セットアップ手順

### 1. リポジトリをクローン

```bash
git clone https://github.com/Mimic52006masaki/PostGenerator.git
cd PostGenerator
```

### 2. Docker Composeでコンテナをビルド・起動

```bash
docker-compose up --build
```

これで、バックエンド（Rails API）とフロントエンド（React + Vite）が起動します。

### 3. フロントエンドにアクセス

ブラウザで以下のURLにアクセスして、アプリケーションを使用できます。

```
http://localhost:5173
```

### 4. バックエンドAPIのエンドポイント

バックエンドAPIは以下のエンドポイントを提供します。

* `POST /api/scrape`: 複数のURLを受け取り、スクレイピング登録を行います。

## 🧪 使用方法

1. フロントエンドのテキストエリアに、1行に1つずつURLを入力します。
2. 「登録」ボタンをクリックすると、バックエンドAPIにPOSTリクエストが送信されます。
3. スクレイピング登録が成功すると、成功メッセージとともに投稿IDが表示されます。
4. 投稿IDをクリックすると、詳細ページへ遷移します。

## 🧹 データの永続化について

Docker Composeで立ち上げた場合、データベースのデータは`db-data`というボリュームに保存されます。コンテナを停止・削除しても、データは保持されます。ただし、ボリューム自体を削除するとデータも失われるため、注意が必要です。

## 📝 ライセンス

このプロジェクトはMITライセンスのもとで公開されています。詳細は[LICENSE](LICENSE)ファイルをご覧ください。

---

このREADME.mdファイルをリポジトリのルートディレクトリに配置し、以下のコマンドでGitHubにプッシュしてください。

```bash
git add README.md
git commit -m "Update README.md"
git push origin main
```

これで、GitHubリポジトリにREADME.mdが反映されます。
