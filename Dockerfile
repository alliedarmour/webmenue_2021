FROM ruby:3.0.0

# Install Node 14 and yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -   
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list   

RUN apt-get update -qq && apt-get install -y \
    nodejs \
    postgresql-client \
    yarn \
    libpq-dev

WORKDIR /app
COPY . /app

RUN gem install bundler
RUN bundle install

RUN yarn install --check-files
