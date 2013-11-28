Given /^"(.*?)" is installed$/ do |app|
  ensure_cli_installed(app)
end
