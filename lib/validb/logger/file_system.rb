module Validb
  module Logger
    class FileSystem < Base
      def prepare
        File.delete(filename) if File.exists?(filename)
        $stdout.puts("Writing output to #{filename}")
      end

      def out(record_hash)
        File.open(filename, "ab+") do |file|
          file.puts("#{record_hash[:model]}:#{record_hash[:id]} - #{record_hash[:error_messages]}")
        end
      end

      private

      def filename
        @filename ||= defined?(Rails) ? Rails.root.join('log', 'validb.log') : "validb.log"
      end
    end
  end
end
