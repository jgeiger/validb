module Validb
  class FileSystemLoggerWorker
    include SidekiqStatus::Worker

    def perform(message)
      logger = Validb::Logger::FileSystem.new
      logger.out(message)
    end
  end
end
