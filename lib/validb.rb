require "active_record"
require "active_support/concern"
require "active_support/core_ext/module/attribute_accessors"
require 'validb/version'

module Validb
  require 'validb/railtie' if defined?(Rails)
  autoload :Configuration, 'validb/configuration'
  autoload :Checker, 'validb/checker'
  autoload :Finder, 'validb/finder'
  autoload :ModelFilterer, 'validb/model_filterer'
  autoload :ModelValidator, 'validb/model_validator'
  autoload :Batcher, 'validb/batcher'
  autoload :RecordValidator, 'validb/record_validator'
  autoload :Parameters, 'validb/parameters'
  autoload :FileSystemLoggerWorker, 'validb/file_system_logger_worker'
  autoload :QueueMonitor, 'validb/queue_monitor'
  autoload :Counter, 'validb/counter'
  autoload :Tasker, 'validb/tasker'
  module Logger
    autoload :FileSystem, 'validb/logger/file_system'
  end
end
