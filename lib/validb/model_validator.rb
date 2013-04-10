module Validb
  class ModelValidator
    include Resque::Plugins::Status

    def perform
      model_name = options["model_name"]
      batch_size = options["batch_size"]
      model_name.constantize.select(:id).find_in_batches(batch_size: batch_size) do |record_batch|
        model_ids = record_batch.map(&:id)
        Validb::Batcher.create(
          "model_name" => model_name,
          "model_ids" => model_ids
        )
      end
    end
  end
end
