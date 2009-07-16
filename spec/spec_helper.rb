require 'spec'

$:.unshift File.dirname(__FILE__) + "/../lib"

require 'thin_ham/init'

Spec::Runner.configure do |config| 
  config.mock_with :flexmock 
end

FIXTURES_ROOT = File.join(
  File.dirname(__FILE__), 
  '/fixtures')
  
# Generates a full path from a path relative to the fixtures root
#
def fixture(path)
  File.join(FIXTURES_ROOT, path)
end

def anything
  FlexMock.any
end