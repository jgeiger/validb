module Validb
  module Logger
    class FileSystem
      def prepare
        File.delete(filename) if File.exists?(filename)
        File.open(filename, "w") {}
        $stdout.puts("Writing output to #{filename}")
      end

      def out(message)
        File.open(filename, "ab+") do |file|
          file.puts(message)
        end
      end

      private

      def filename
        @filename ||= defined?(Rails) ? Rails.root.join('log', 'validb.log') : "validb.log"
      end
    end
  end
end
