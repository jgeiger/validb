require 'spec_helper'

describe Validb::ModelValidator do
  describe "#initialize" do
    it "creates a model validator" do
      logger = double('logger')
      Validb::Batcher.should_receive(:new).with(logger)
      Validb::ModelValidator.new(logger)
    end
  end

  describe "#validate" do
    it "validates the records of the model" do
      model = Blog
      logger = double('logger')
      model_validator = Validb::ModelValidator.new(logger)

      $stdout.should_receive(:puts).with("Checking Blog")
      model_validator.validate(model)
    end
  end
end
