module Validb
  class Checker

    def initialize(params, logger)
      @model_validator = Validb::ModelValidator.new(params, logger)
    end

    def check(models)
      models.each do |model|
        @model_validator.validate(model)
      end
    end
  end
end
