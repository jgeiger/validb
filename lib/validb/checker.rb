module Validb
  class Checker
    include SidekiqStatus::Worker

    def perform(model_names, batch_size)
      model_names.each do |model_name|
        Validb::ModelValidator.perform_async(model_name, batch_size)
      end
    end
  end
end
