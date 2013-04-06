module Validb
  class Counter
    def initialize(model_names)
      @models = model_names.map(&:constantize)
    end

    def count
      $stdout.puts("\nChecking models:")
      @models.each do |model|
        $stdout.puts("#{model}(#{model.table_name}) (#{model.count} records)")
      end
    end
  end
end
