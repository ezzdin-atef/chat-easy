FROM ruby:3.3.0-bullseye

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install --no-install-recommends -y build-essential default-libmysqlclient-dev git libvips pkg-config

# RUN gem install rails

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

COPY /bin/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
RUN chmod +x /app/bin/rails
# ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3000


# Configure the main process to run when running the image

CMD ["rails", "server"]
