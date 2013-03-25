module Validb
  class Finder
    class << self
      def get_models(model_name_string)
        model_name_string ||= ""
        filter_models(model_name_string.split(",").map(&:strip))
      end

      private

      def all
        @models ||= ActiveRecord::Base.descendants.select { |model| model.table_name }
      end

      def filter_models(model_names)
        if model_names.any?
          all.select { |model| model_names.include?(model.name) }
        else
          all
        end
      end
    end
  end
end
