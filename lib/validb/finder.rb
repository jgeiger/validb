module Validb
  class Finder

    def initialize(model_name_string)
      @model_name_string = model_name_string || ""
    end

    def models
      model_names.empty? ? all : all.select { |model| model_names.include?(model.name) }
    end

    private

    def model_names
      @model_names ||= @model_name_string.split(",").map(&:strip)
    end

    def all
      @models ||= ActiveRecord::Base.descendants.select { |model| model.table_exists? }
    end
  end
end
