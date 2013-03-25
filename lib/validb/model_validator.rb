module Validb
  class ModelValidator
    class << self
      def validate(model)
        puts "Checking #{model}"

        model.find_in_batches do |batch|
          validate_batch(batch)
        end
      end

      private

      def validate_batch(record_batch)
        puts "."
        record_batch.each do |record|
          RecordValidator.validate(record)
        end
      end
    end
  end
end
