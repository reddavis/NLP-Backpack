require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/evaluation/confusion_matrix'

include NLPBackpack::Evaluation

describe ConfusionMatrix do
  before(:all) do
    correct = [1,1,2,1,1,1,1,1,1,1]
    test    = [1,1,3,1,1,1,1,1,1,1]
    @cm = ConfusionMatrix.new(correct, test)
  end

  describe "Specific element" do
    it "should return 90.0%" do
      @cm.results_for(1, 1).should == "90.0%"
    end

    it "should return 10.0%" do
      @cm.results_for(2, 3).should == "10.0%"
    end
  end

  describe "Inspect" do
    it "should match <90.0%>" do
      @cm.inspect.should match(/<90.0%>/)
    end

    it "should match 10.0%" do
      puts @cm.inspect
      @cm.inspect.should match(/10.0%/)
    end
  end
end