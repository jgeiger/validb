require 'spec_helper'

describe Validb::RecordValidator do
  describe "#validate" do
    context "with a valid record" do
      it "validates the passed in record" do
        logger = double(:logger)
        record_validator = Validb::RecordValidator.new(logger)
        record = Blog.new(title: "title")

        logger.should_not_receive(:out)
        record_validator.validate(record)
      end
    end

    context "with an invalid record" do
      it "outputs the record information" do
        logger = double(:logger)
        record_validator = Validb::RecordValidator.new(logger)
        record = Blog.new
        record.save(validate: false)

        hash = {
          model: "Blog",
          id: record.id,
          error_messages: "Title can't be blank"
        }
        logger.should_receive(:out).with(hash)
        record_validator.validate(record)
      end
    end
  end
end
