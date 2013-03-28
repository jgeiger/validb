require 'spec_helper'

describe Validb::ModelValidator do
  describe "#initialize" do
    it "creates a model validator" do
      logger = double('logger')
      params = double('params')
      Validb::Batcher.should_receive(:new).with(logger)
      Validb::ModelValidator.new(params, logger)
    end
  end

  describe "#validate" do
    it "validates the records of the model" do
      model = Blog
      logger = double('logger')
      params = double('params', batch_size: 200)
      model_validator = Validb::ModelValidator.new(params, logger)

      $stdout.should_receive(:print).with("\nChecking Blog(blogs) (0 records).")
      model.should_receive(:find_in_batches).with(batch_size: 200)
      model_validator.validate(model)
    end
  end
end
