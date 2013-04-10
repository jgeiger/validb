module Validb
  class Batcher
    include Resque::Plugins::Status

    def perform
      model_name = options["model_name"]
      model_ids = options["model_ids"]
      model_name.constantize.find(model_ids).each do |record|
        record_validator = Validb::RecordValidator.new
        record_validator.validate(record)
      end
    end
  end
end
