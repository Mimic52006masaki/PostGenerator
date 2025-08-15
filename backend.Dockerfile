FROM ruby:3.2

# Node.js と PostgreSQLクライアントをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# 作業ディレクトリ
WORKDIR /app

# Gemfile と Gemfile.lock をコピー（api 配下から）
COPY ./api/Gemfile ./api/Gemfile.lock ./

# bundle install
RUN bundle install

# Railsアプリ全体をコピー
COPY ./api ./

# ポート
EXPOSE 3000

# Railsサーバー起動（開発用）
CMD ["bash", "-c", "bundle exec rails server -b 0.0.0.0 -p 3000"]
