require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include NLPBackpack::Evaluation

describe Accuracy do
  before(:all) do
    @accuracy = Accuracy.new([1,1,2,2], [1,1,2,1])
  end

  describe "Specific element" do
    it "should return 100" do
      @accuracy.accuracy_of(1).should == 100
    end

    it "should return 50" do
      @accuracy.accuracy_of(2).should == 50
    end
  end

  describe "Inspect" do
    it "should match 100%" do
      @accuracy.inspect.should match(/100%/)
    end

    it "should match 50%" do
      @accuracy.inspect.should match(/50%/)
    end
  end
end