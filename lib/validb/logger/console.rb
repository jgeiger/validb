module Validb
  module Logger
    class Console < Base
      def out(record_hash)
        $stdout.puts "\n#{record_hash[:model]}:#{record_hash[:id]} - #{record_hash[:error_messages]}"
      end
    end
  end
end
