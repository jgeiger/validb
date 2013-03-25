require 'spec_helper'

describe Validb::ModelValidator do
  describe "#validate" do
    context "with a model" do
      it "validates the records of the model" do
        model = Blog
        $stdout.should_receive(:puts).with("Checking Blog")

        Validb::ModelValidator.validate(model)
      end
    end
  end
end
