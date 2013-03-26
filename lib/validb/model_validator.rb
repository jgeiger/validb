module Validb
  class ModelValidator

    def initialize(logger)
      @batcher = Validb::Batcher.new(logger)
    end

    def validate(model)
      puts "Checking #{model}"
      model.find_in_batches do |record_batch|
        @batcher.validate(record_batch)
      end
    end
  end
end
