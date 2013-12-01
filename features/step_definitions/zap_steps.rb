require 'rest-client'
require 'json'

Given(/^ZAP is running$/) do
  puts "Starting ZAP"
  run("/opt/ZAP_2.2.2/zap.sh -daemon")
  sleep 5
end

When(/^we scan the site via the proxy$/) do
  RestClient.proxy = "http://127.0.0.1:8080"

  RestClient.get "http://www.garethrushgrove.com/"
  sleep 2

  RestClient.get "http://zap/JSON/spider/action/scan?url=http://www.garethrushgrove.com/"
  sleep 2

  RestClient.get "http://zap/JSON/ascan/action/scan?url=http://www.garethrushgrove.com/"
  sleep 2

  response = RestClient.get "http://zap/JSON/core/view/alerts/"
  json_response = JSON.parse(response)

  @alerts = json_response['alerts']
  @low_priority_alerts = @alerts.select {|alert| alert['risk'] == "Low" }
  @high_priority_alerts = @alerts.select {|alert| alert['risk'] == "High" }

  RestClient.get "http://zap/JSON/core/action/shutdown/"
end

Then(/^we should find less than "(\d+)" alerts$/) do |number_of_alerts|
  @alerts.size.should < number_of_alerts.to_i
end

Then(/^we should find less than "(\d+)" low priority alerts$/) do |number_of_alerts|
  @low_priority_alerts.size.should < number_of_alerts.to_i
end

Then(/^we should find less than "(\d+)" high priority alerts$/) do |number_of_alerts|
  @high_priority_alerts.size.should < number_of_alerts.to_i
end
