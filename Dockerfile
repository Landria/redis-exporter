FROM ruby:2.6.5

WORKDIR /app
COPY . /app
RUN gem install bundler:2.1.4
RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
