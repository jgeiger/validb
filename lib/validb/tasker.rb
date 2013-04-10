module Validb
  class Tasker

    def initialize(model_names, filename)
      @model_names = model_names
      @filename = filename
    end

    def run
      remove_existing_statuses
      load_models_and_prepare_logger
      output_model_table_record_count
      validate_database_records
    end

    private

    def params
      @params ||= Validb::Configuration.new(@filename).params
    end

    def finder
      @finder ||= Validb::Finder.new(params, @model_names)
    end

    def remove_existing_statuses
      Resque::Plugins::Status::Hash.clear
    end

    def load_models_and_prepare_logger
      # force all models to load so we can find them
      Rails.application.eager_load!
      ActiveRecord::Base.logger.level = 1
      Validb::Logger::FileSystem.new.prepare
    end

    def output_model_table_record_count
      Validb::Counter.new(finder.models).count
    end

    def validate_database_records
      Validb::Checker.create(
        "model_names" => finder.models,
        "batch_size" => params.batch_size
      )
      monitor_job_progress
    end

    def monitor_job_progress
      queue_monitor = Validb::QueueMonitor.new
      queue_monitor.monitor
    end
  end
end
