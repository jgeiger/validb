module Validb
  class RecordValidator
    def self.validate(record)
      if !record.valid?
        puts "#{record.id} - #{record.errors.full_messages.join(',')}"
      end
    end
  end
end
