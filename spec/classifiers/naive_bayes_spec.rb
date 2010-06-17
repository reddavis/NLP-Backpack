require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/classifiers/naive_bayes'

describe NaiveBayes do
  it "should have defined NaiveBayes" do
    defined?(NaiveBayes).should be_true
  end
end
