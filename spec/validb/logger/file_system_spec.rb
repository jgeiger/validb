require 'spec_helper'

describe Validb::Logger::FileSystem do
  describe "#prepare" do
    context "when the file exists" do
      it "deletes the file" do
        File.should_receive(:exists?).with("validb.log").and_return(true)
        File.should_receive(:delete).with("validb.log")

        $stdout.should_receive(:puts).with("Writing output to validb.log")

        file_logger = Validb::Logger::FileSystem.new
        file_logger.prepare
      end
    end

    context "when the file does not exist" do
      it "does nothing" do
        File.should_receive(:exists?).with("validb.log").and_return(false)
        File.should_not_receive(:delete)

        $stdout.should_receive(:puts).with("Writing output to validb.log")

        file_logger = Validb::Logger::FileSystem.new
        file_logger.prepare
      end
    end
  end

  describe "#out" do
    it "writes the hash output to a file and prints an X" do
      file = double('file')
      File.should_receive(:open).with("validb.log", "ab+").and_yield(file)
      file.should_receive(:puts).with("Blog:1 - Error message")

      hash = { model: Blog, id: 1, error_messages: "Error message" }
      file_logger = Validb::Logger::FileSystem.new
      file_logger.out(hash)
    end
  end
end
