FROM ruby:3.2

# 必要なパッケージをインストール
# Node.js と PostgreSQLクライアントをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# 作業ディレクトリ
WORKDIR /app

# GemfileとGemfile.lockを先にコピー
COPY ./api/Gemfile ./api/Gemfile.lock ./

# Gemをインストール
# --jobs 4 で並列インストール、--retry 3 で失敗時にリトライ
# vendor/bundle にインストールし、アプリケーションコードと分離
RUN bundle config set --local path 'vendor/bundle' && bundle install --jobs 4 --retry 3

# アプリケーションコードをコピー
COPY ./api ./

# entrypoint.shをコピーして実行権限を付与
COPY ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# ポート
EXPOSE 3000

# Railsサーバー起動（開発用）
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
