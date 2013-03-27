module Validb
  class ModelFilterer

    def initialize(configuration)
      @configuration = configuration
    end

    def filter(models)
      filtered_models = validatable_models(models)
      filtered_models = non_inherited_models(filtered_models)
      filtered_models = non_ignored_models(filtered_models)
      non_ignored_prefix_models(filtered_models)
    end

    private

    def ignored_models
      @configuration.ignored_models
    end

    def ignored_prefixes
      @configuration.ignored_prefixes
    end

    def non_ignored_prefix_models(models)
      models.reject do |model|
        ignored_prefixes.include?(model.name.split("::").first)
      end
    end

    def non_ignored_models(models)
      models - ignored_models
    end

    def non_inherited_models(models)
      models.reject { |model| model != model.base_class && models.include?(model.base_class)}
    end

    def validatable_models(models)
      models.select { |model| model.validators.any? }
    end
  end
end
