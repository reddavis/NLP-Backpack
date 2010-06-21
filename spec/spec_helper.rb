$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'nlp_backpack'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|

end

module Evaluation
  def self.correct_results
    [1,1,2,1,1,1,1,1,1,1]
  end

  def self.test_results
    [1,1,3,1,1,1,1,1,1,1]
  end
end

module FeatureSelection
  def self.data
    {
    :spam => [['this', 'is', 'this', 'some', 'yer', 'information'], ['this', 'is', 'something', 'that', 'is', 'information']],
    :ham => [['this', 'test', 'some', 'more', 'information'], ['there', 'are', 'some', 'things']],
    }
  end
end