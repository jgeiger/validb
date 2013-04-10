module Validb
  class Checker
    include Resque::Plugins::Status

    def perform
      model_names = options["model_names"]
      batch_size = options["batch_size"]
      model_names.each do |model_name|
        Validb::ModelValidator.create(
          "model_name" => model_name,
          "batch_size" => batch_size
        )
      end
    end
  end
end
