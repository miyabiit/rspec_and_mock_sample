#!/usr/bin/env ruby
=begin
Twitter::OAuthというtwitterライブラリ内蔵のOAuth部分は最近のバージョンでは削除されたらしく、
ネットの情報を参考にしていた時それを使っているコードは動かなかった。
=end
require "twitter"

class SampleTweet
	def initialize consumer_token_key, consumer_secret, access_token_key, access_secret
		#OAuth
		@twitter = Twitter::Client.new do |config|
			config.consumer_key = consumer_token_key
			config.consumer_secret = consumer_secret
			config.access_token = access_token_key
			config.access_token_secret = access_secret
		end
	end

	def hoge
		@twitter.update("hoge")
	end
end
