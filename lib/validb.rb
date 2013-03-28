require "active_record"
require "active_support/concern"
require "active_support/core_ext/module/attribute_accessors"
require 'validb/version'

module Validb
  require 'validb/railtie' if defined?(Rails)
  autoload :Configuration, 'validb/configuration'
  autoload :ConsoleLogger, 'validb/console_logger'
  autoload :Checker, 'validb/checker'
  autoload :Finder, 'validb/finder'
  autoload :ModelFilterer, 'validb/model_filterer'
  autoload :ModelValidator, 'validb/model_validator'
  autoload :Batcher, 'validb/batcher'
  autoload :RecordValidator, 'validb/record_validator'
  autoload :Parameters, 'validb/parameters'
end
