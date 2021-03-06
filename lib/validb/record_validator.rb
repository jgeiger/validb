module Validb
  class RecordValidator

    def validate(record)
      if !record.valid?
        message = "FAIL: #{record.class.name}:#{record.id} - #{record.errors.full_messages.join(',')}"
        Validb::FileSystemLoggerWorker.perform_async(message)
      end
    end
  end
end
