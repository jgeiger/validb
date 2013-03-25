module Validb
  class Checker
    class << self
      def check(model_names)
        models = Validb::Finder.get_models(model_names)
        models.each do |model|
          Validb::ModelValidator.validate(model)
        end
      end
    end
  end
end
