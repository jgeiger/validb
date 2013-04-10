require 'spec_helper'

describe Validb::FileSystemLoggerWorker do
  describe "#perform" do
    it "sends the message to the File System logger" do
      Resque.stub(:inline?).and_return(true)
      Validb::Logger::FileSystem.any_instance.should_receive(:out).with("message")

      uuid = Validb::FileSystemLoggerWorker.create(
        "message" => "message"
      )
    end
  end
end
