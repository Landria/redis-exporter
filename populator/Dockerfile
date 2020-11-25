FROM ruby:2.6.5

WORKDIR /populator
COPY populator.rb ./

COPY . .

RUN gem install bundler:2.1.4
RUN bundle install

CMD ["ruby", "./populator.rb"]
