require 'mongo'
require 'twitter'

Twitter.configure do |config|
  config.consumer_key       = 'key'
  config.consumer_secret    = 'secret'
  config.oauth_token        = 'token'
  config.oauth_token_secret = 'secret'
end

module Yokubou
  TWEET = Mongo::MongoClient.new.db('yokubou')['tweet']
end
