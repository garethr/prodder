source "https://rubygems.org"

gem "debugger"
gem "rake"

if ENV['PRODDER_DEV']
    gem 'prodder-steps', :path => '../prodder-steps'
else
  gem "prodder-steps", "~> 0.0.2"
end
