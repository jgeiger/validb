namespace :validb do
  desc "Check DB for invalid records"
  task :validate, [:model_names] => [:environment] do |t, args|
    Rails.application.eager_load!
    Validb::Checker.check(args[:model_names])
  end
end
