require "active_record"
require "active_support/concern"
require "active_support/core_ext/module/attribute_accessors"
require 'validb/version'

module Validb
  require 'validb/railtie' if defined?(Rails)
  autoload :Checker, 'validb/checker'
  autoload :Finder, 'validb/finder'
  autoload :RecordValidator, 'validb/record_validator'
  autoload :ModelValidator, 'validb/model_validator'
end
