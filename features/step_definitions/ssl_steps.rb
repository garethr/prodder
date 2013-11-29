Before do
  @aruba_timeout_seconds = 5
end

When(/^we test using the "(.*?)" protocol$/) do |protocol|
  step("I run `sslyze.py --#{protocol} #{ENV['HOST']}`")
  step("the exit status should be 0")
end

When(/^we check the certificate$/) do
  step("I run `sslyze.py --certinfo=basic #{ENV['HOST']}`")
  step("the exit status should be 0")
end

When(/^we test certificate renegotiation$/) do
  step("I run `sslyze.py --reneg #{ENV['HOST']}`")
  step("the exit status should be 0")
end
