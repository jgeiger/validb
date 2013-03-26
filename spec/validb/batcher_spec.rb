require 'spec_helper'

describe Validb::Batcher do
  describe "#initialize" do
    it "creates a batcher" do
      logger = double('logger')
      Validb::RecordValidator.should_receive(:new).with(logger)
      Validb::Batcher.new(logger)
    end
  end

  describe "#validate" do
    it "validates the batch of records" do
      record_batch = [Blog.new(title: "Title")]
      logger = double('logger')
      batcher = Validb::Batcher.new(logger)

      $stdout.should_receive(:puts).with(".")
      batcher.validate(record_batch)
    end
  end
end
