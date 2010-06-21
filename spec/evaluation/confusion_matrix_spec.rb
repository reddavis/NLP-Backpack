require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include NLPBackpack::Evaluation

describe ConfusionMatrix do
  before(:all) do
    @cm = ConfusionMatrix.new(Evaluation.correct_results, Evaluation.test_results)
  end

  describe "Specific element" do
    it "should return 90%" do
      @cm.results_for(1, 1).should == "90%"
    end

    it "should return 10%" do
      @cm.results_for(2, 3).should == "10%"
    end
  end

  describe "Inspect" do
    it "should match <90%>" do
      @cm.inspect.should match(/<90%>/)
    end

    it "should match 10%" do
      @cm.inspect.should match(/10%/)
    end
  end
end