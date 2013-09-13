require './sample_tweet.rb'
=begin
方針
----

* テスト内容 -- SampleTweet#hogeを実行し、例外が発生しないこと
* Twitterとは通信しない -- Twitter関連のコードは適当にパスさせる
* Twitter::Clientのモックを作成しメソッドを偽装する
* Twitter::Client#newがモックのインスタンスを返すように偽装
	
=end

RSpec.configure do |config|
	config.mock_framework = :mocha
end

describe SampleTweet do
	before(:all) do
		@twitter_client = mock("Twitter::Client")
		@twitter_client.stubs(:update)
		Twitter::Client.stubs(:new).returns(@twitter_client)

		@sample = SampleTweet.new 'consumer_token_key', 'consumer_secret', 'access_token_key', 'access_secret'
	end

	it 'should post "hoge" to twitter' do
		@sample.hoge
	end
end
