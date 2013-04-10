module Validb
  class FileSystemLoggerWorker
    include Resque::Plugins::Status

    def perform
      message = options["message"]
      logger = Validb::Logger::FileSystem.new
      logger.out(message)
    end
  end
end
