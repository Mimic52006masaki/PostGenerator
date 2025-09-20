#!/bin/bash
set -e

# Railsのserver.pidが残っていると起動に失敗するため、削除する
rm -f /app/tmp/pids/server.pid

# DBが起動するまで待つ
echo "Waiting for db to be ready..."
until pg_isready -h db -p 5432 -U postgres; do
  sleep 1
done
echo "DB is ready!"

# データベースの作成とマイグレーション
bundle exec rails db:prepare

# CMDで渡されたコマンドを実行する
exec "$@"