require 'spec_helper'

describe Validb::RecordValidator do
  describe "#validate" do
    context "with a valid record" do
      it "validates the passed in record" do
        record = Blog.new(title: "title")
        record_validator = Validb::RecordValidator.new

        expect {
          record_validator.validate(record)
        }.not_to change(Validb::FileSystemLoggerWorker.jobs, :size)
      end
    end

    context "with an invalid record" do
      it "outputs the record information" do
        record_validator = Validb::RecordValidator.new
        record = Blog.new
        record.save(validate: false)

        expect {
          record_validator.validate(record)
        }.to change(Validb::FileSystemLoggerWorker.jobs, :size).by(1)
      end
    end
  end
end
