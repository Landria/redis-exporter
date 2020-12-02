FROM ruby:2.6.5

WORKDIR /api
COPY . /api
RUN gem install bundler:2.1.4
RUN bundle install

EXPOSE 9999

CMD ["bundle", "exec","rackup", "--host", "0.0.0.0", "-p", "9999"]
