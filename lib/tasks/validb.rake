namespace :validb do
  desc "Check DB for invalid records"
  task :validate => :environment do
    models = ENV["models"] || ""
    logger = ENV["logger"] || "Validb::ConsoleLogger"

    # force all models to load so we can find them
    Rails.application.eager_load!
    finder = Validb::Finder.new(models)

    console_logger = logger.constantize.new
    checker = Validb::Checker.new(console_logger)
    checker.check(finder.models)
  end
end
