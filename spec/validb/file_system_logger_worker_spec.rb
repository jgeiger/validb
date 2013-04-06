require 'spec_helper'

describe Validb::FileSystemLoggerWorker do
  describe "#perform" do
    it "sends the message to the File System logger" do
      Validb::Logger::FileSystem.any_instance.should_receive(:out).with("message")

      logger = Validb::FileSystemLoggerWorker.new
      jid = Validb::Batcher.perform_async("message")

      logger.perform(jid)
    end
  end
end
