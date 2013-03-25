require 'validb'
require 'rails'

module Validb
  class Railtie < Rails::Railtie
    railtie_name :validb

    rake_tasks do
      load "tasks/validb.rake"
    end
  end
end
