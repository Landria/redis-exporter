require 'redis'

redis = Redis.new(host: "redis", port: 6379)

(0..rand(1000..10000)).map do |n|
  redis.set("key_#{n}", n**2)
end
