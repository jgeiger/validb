require 'spec_helper'

describe Validb::Checker do
  describe ".check" do
    context "without specified models" do
      it "validates the passed in model's records" do
        Validb::ModelValidator.should_receive(:validate).with(Blog)
        Validb::ModelValidator.should_receive(:validate).with(Post)
        Validb::ModelValidator.should_receive(:validate).with(Comment)
        Validb::Checker.check("")
      end
    end

    context "with specified models" do
      it "validates the passed in model's records" do
        Validb::ModelValidator.should_receive(:validate).with(Blog)
        Validb::ModelValidator.should_receive(:validate).with(Post)
        Validb::ModelValidator.should_not_receive(:validate).with(Comment)
        Validb::Checker.check("Blog, Post")
      end
    end
  end
end
