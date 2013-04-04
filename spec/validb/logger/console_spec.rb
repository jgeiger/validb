require 'spec_helper'

describe Validb::Logger::Console do
  describe "#out" do
    it "prints the hash output" do
      hash = { model: Blog, id: 1, error_messages: "Error message" }

      console_logger = Validb::Logger::Console.new
      $stdout.should_receive(:puts).with("\nBlog:1 - Error message")
      console_logger.out(hash)
    end
  end
end
