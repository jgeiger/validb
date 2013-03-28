module Validb
  class ModelFilterer

    def initialize(params)
      @params = params
    end

    def filter(models)
      filtered_models = validatable_models(models)
      filtered_models = non_ignored_models(filtered_models)
      filtered_models = non_ignored_prefix_models(filtered_models)
      non_inherited_models(filtered_models).sort_by(&:name)
    end

    private

    def ignored_models
      @params.ignored_models
    end

    def ignored_prefixes
      @params.ignored_prefixes
    end

    def non_inherited_models(models)
      models.reject { |model| (models & model.descendants).any? }
    end

    def non_ignored_prefix_models(models)
      models.reject do |model|
        ignored_prefixes.include?(model.name.split("::").first)
      end
    end

    def non_ignored_models(models)
      models - ignored_models
    end

    def validatable_models(models)
      models.select { |model| model.validators.any? }
    end
  end
end
