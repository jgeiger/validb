require 'bundler'
Bundler::GemHelper.install_tasks

task :default => :spec

def bundle_exec(command)
  sh %Q{bundle update && bundle exec #{command}}
end

def bundle_install_dependencies
  sh %Q{bundle install --path vendor/bundle}
end

desc "Run all specs"
task "spec" do
  bundle_exec("rspec spec")
end

desc "Install dependencies"
task "dependencies" do
  bundle_install_dependencies
end
