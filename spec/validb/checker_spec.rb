require 'spec_helper'

describe Validb::Checker do
  describe "#initialize" do
    it "creates a checker" do
      logger = double('logger')
      params = double('params')
      Validb::ModelValidator.should_receive(:new).with(params, logger)
      Validb::Checker.new(params, logger)
    end
  end

  describe "#check" do
    it "validates the passed in models records" do
      logger = double('logger')
      params = double('params')
      model_validator = double('model_validator')
      Validb::ModelValidator.should_receive(:new).with(params, logger).and_return(model_validator)
      checker = Validb::Checker.new(params, logger)

      model_validator.should_receive(:validate).with(Blog)
      model_validator.should_receive(:validate).with(Post)

      checker.check([Blog, Post])
    end
  end
end
