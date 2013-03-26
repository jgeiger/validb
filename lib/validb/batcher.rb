module Validb
  class Batcher

    def initialize(logger)
      @record_validator = RecordValidator.new(logger)
    end

    def validate(record_batch)
      puts "."
      record_batch.each do |record|
        @record_validator.validate(record)
      end
    end
  end
end
