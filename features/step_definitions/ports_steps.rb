require 'tempfile'
require 'nmap/program'
require 'nmap/xml'

When(/^we scan the site for open ports$/) do
  file = Tempfile.new('nmap.xml')
  Nmap::Program.scan do |nmap|
    nmap.xml = file.path
    nmap.targets = ENV['HOST']
  end

  @open_ports = []
  Nmap::XML.new(file.path) do |xml|
    xml.each_host do |host|
      host.each_port do |port|
        @open_ports << port.number if port.state == :open
      end
    end
  end
end

Then(/^we should find port "(.*?)" open$/) do |port|
  @open_ports.should include(port.to_i)
end

Then(/^we should find port "(.*?)" closed$/) do |port|
  @open_ports.should_not include(port.to_i)
end

Then(/^we should find only "(.*?)" port open$/) do |number|
  @open_ports.should have(number.to_i).items
end
