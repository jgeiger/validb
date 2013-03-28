module Validb
  class Configuration

    def initialize(filename)
      @filename = filename
      print_ignored
    end

    def params
      Validb::Parameters.new(ignored_models, ignored_prefixes, batch_size)
    end

    private

    def ignored_models
      convert_model_name_strings_to_constants
    end

    def ignored_prefixes
      config["ignored_prefixes"]
    end

    def batch_size
      config["batch_size"]
    end

    def print_ignored
      puts "Ignoring prefixes: #{ignored_prefixes.join(',')}" if ignored_prefixes.any?
      puts "Ignoring models: #{config['ignored_models'].join(',')}" if ignored_models.any?
    end

    def config
      @config ||= begin
                    if configuration_exists?
                      JSON.parse(IO.read(@filename))
                    else
                      {
                        "ignored_models" => [],
                        "ignored_prefixes" => [],
                        "batch_size" => 100
                      }
                    end
                  end
    end

    def configuration_exists?
      File.exists?(@filename)
    end

    def convert_model_name_strings_to_constants
      config["ignored_models"].map do |model_string|
        begin
          model_string.constantize
        rescue NameError
        end
      end.compact
    end
  end
end
