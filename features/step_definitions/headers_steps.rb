require 'rest_client'

def canonical_header(header)
  header.downcase.gsub('-', '_').to_sym
end

When(/^we request the site over "(.*?)"$/) do |protocol|
  @response = RestClient.get "#{protocol.downcase}://#{ENV['HOST']}"
end

Then(/^the "(.*?)" header should be set to "(.*?)"$/) do |header, value|
  @response.headers.should include(canonical_header(header) => value)
end

Then(/^the "(.*?)" header should not be set$/) do |header|
  @response.headers.should_not have_key(canonical_header(header))
end

Then(/^the "(.*?)" header should be set$/) do |header|
  @response.headers.should have_key(canonical_header(header))
end

Then(/^the "(.*?)" header should have the "(.*?)" attribute$/) do |header, attribute|
  @response.headers[canonical_header(header)].to_s.should =~ /#{attribute}/
end
