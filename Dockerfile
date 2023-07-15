FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# railsアプリを配置するディレクトリを作成して作業ディレクトリとする
RUN mkdir /38_ina_mystery
WORKDIR /38_ina_mystery

# ホストのGemfile達をコンテナ内にコピー
COPY Gemfile /38_ina_mystery/Gemfile
COPY Gemfile.lock /38_ina_mystery/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /38_ina_mystery

# -bはバインドを意味する
CMD ["rails", "server", "-b", "0.0.0.0"]