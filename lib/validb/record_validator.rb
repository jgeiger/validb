module Validb
  class RecordValidator

    def initialize(logger)
      @logger = logger
    end

    def validate(record)
      if !record.valid?
        @logger.out(
          {
            model: record.class.name,
            id: record.id,
            error_messages: record.errors.full_messages.join(',')
          }
        )
      end
    end
  end
end
