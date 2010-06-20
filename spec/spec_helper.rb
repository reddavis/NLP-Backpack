$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'nlp_backpack'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|

end

def correct_results
  [1,1,2,1,1,1,1,1,1,1]
end

def test_results
  [1,1,3,1,1,1,1,1,1,1]
end