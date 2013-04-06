namespace :validb do
  desc "Check DB for invalid records"
  task :validate => :environment do
    models = ENV["models"] || ""
    filename = ENV["config"] || default_configuration_file

    Validb::Tasker.new(models, filename).run
  end

  desc "Generate config/validb.json"
  task :generate_config => :environment do
    if File.exists?(default_configuration_file)
      puts "Configuration already exists at config/validb.json"
    else
      puts "Writing configuration to config/validb.json"
      write_configuration_file
    end
  end

  def default_configuration_file
    @default_configuration_file ||= Rails.root.join('config', 'validb.json')
  end

  def default_configuration
    { "ignored_models" => [], "ignored_prefixes" => [], "batch_size" => 1000 }
  end

  def write_configuration_file
    File.open(default_configuration_file,'w') do |file|
      file.puts JSON.pretty_generate(default_configuration)
    end
  end
end
