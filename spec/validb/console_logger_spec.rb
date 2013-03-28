require 'spec_helper'

describe Validb::ConsoleLogger do
  describe "#out" do
    it "prints the hash output" do
      hash = { model: Blog, id: 1, error_messages: "Error message" }

      console_logger = Validb::ConsoleLogger.new
      $stdout.should_receive(:puts).with("\nBlog:1 - Error message")
      console_logger.out(hash)
    end
  end
end
