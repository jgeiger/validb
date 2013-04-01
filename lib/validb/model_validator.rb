module Validb
  class ModelValidator

    def initialize(params, logger)
      @params = params
      @batcher = Validb::Batcher.new(logger)
    end

    def validate(model)
      $stdout.print "\nChecking #{model}(#{model.table_name}) (#{model.count} records)"
      model.find_in_batches(batch_size: @params.batch_size) do |record_batch|
        @batcher.validate(record_batch)
      end
    end
  end
end
