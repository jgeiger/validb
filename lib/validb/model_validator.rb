module Validb
  class ModelValidator
    include SidekiqStatus::Worker

    def perform(model_name, batch_size)
      model_name.constantize.select(:id).find_in_batches(batch_size: batch_size) do |record_batch|
        model_ids = record_batch.map(&:id)
        Validb::Batcher.perform_async(model_name, model_ids)
      end
    end
  end
end
