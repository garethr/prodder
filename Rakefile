require 'cucumber/rake/task'

namespace :prod do

  Cucumber::Rake::Task.new("all", "Run all probes")

  ["zap", "ssl", "ports", "headers"].each do |tag|
    Cucumber::Rake::Task.new(tag, "Only run the #{tag} probes") do |t|
      t.cucumber_opts = "--tags @#{tag}"
    end
  end

end

task :default => "prod:all"
