require 'spec_helper'

describe Validb::RecordValidator do
  describe "#validate" do
    context "with a valid record" do
      it "validates the passed in record" do
        Validb::FileSystemLoggerWorker.should_not_receive(:create)

        record = Blog.new(title: "title")

        record_validator = Validb::RecordValidator.new
        record_validator.validate(record)
      end
    end

    context "with an invalid record" do
      it "outputs the record information" do
        Validb::FileSystemLoggerWorker.should_receive(:create)

        record = Blog.new

        record_validator = Validb::RecordValidator.new
        record_validator.validate(record)
      end
    end
  end
end
