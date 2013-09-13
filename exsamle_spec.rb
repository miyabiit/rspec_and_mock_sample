RSpec.configure do |config|
	config.mock_framework = :mocha
end

describe "mocking with RSpec" do
	it "passes when it should" do
		receiver = mock('receiver')
		receiver.expects(:message).once
		receiver.message
	end
end

describe "mocking with RSpec" do
	it "fails when it should" do
		receiver = mock('receiver')
		receiver.expects(:message).once
	end
end

describe "failed message expectation in a pending block" do
	it "is listed as pending" do
		pending do
			receiver = mock("receiver")
			receiver.expects(:message).once
		end
	end
end

describe "passing message expectation in a pending block" do
	it "fails with FIXED" do 
		pending do
			receiver = mock("receiver")
			receiver.expects(:message).once
			receiver.message
		end
	end
end

describe "RSpec.configuration.mock_framework.framework_name" do
	it "returns :mocha" do
		RSpec.configuration.mock_framework.framework_name.should eq(:mocha)
	end
end
