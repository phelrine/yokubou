# -*- coding: utf-8 -*-
$:.unshift(File.dirname(__FILE__))
require 'sinatra'
require 'config'
require 'json'

get '/' do
  erb :index
end

get '/yokubou' do
  content_type :json
  JSON.unparse(Yokubou::TWEET.find().sort('id').limit(100).map{|s|
      s['text'].gsub(/人生だった$/, '')
    })
end
