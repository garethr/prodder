source "https://rubygems.org"

gem "rake"

if ENV['PRODDER_DEV']
  gem "debugger"
  gem 'prodder-steps', :path => '../prodder-steps'
else
  gem "prodder-steps", "~> 0.0.2"
end
