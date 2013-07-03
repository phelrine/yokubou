#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
$:.unshift(File.dirname(__FILE__))
require 'config'

Twitter.search('したい人生だった').results.map{|status|
  next if status.retweeted_status
  next if status.in_reply_to_status_id
  if status.text =~ /したい人生だった$/
    Yokubou::TWEET.update({id: status.id}, status.to_hash, {upsert: true})
  end
}
