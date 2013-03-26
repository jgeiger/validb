module Validb
  class ConsoleLogger

    def out(record_hash)
      puts "#{record_hash[:model]}:#{record_hash[:id]} - #{record_hash[:error_messages]}"
    end
  end
end
