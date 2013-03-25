require 'spec_helper'

describe Validb::RecordValidator do
  describe "#validate" do
    context "with a valid record" do
      it "validates the passed in record" do
        record = Blog.new(title: "title")

        $stdout.should_not_receive(:puts)

        Validb::RecordValidator.validate(record)
      end
    end

    context "with an invalid record" do
      it "outputs the record information" do
        record = Blog.new
        record.save(validate: false)

        $stdout.should_receive(:puts).with("#{record.id} - Title can't be blank")

        Validb::RecordValidator.validate(record)
      end
    end
  end
end
