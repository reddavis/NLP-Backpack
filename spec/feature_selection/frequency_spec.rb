require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include NLPBackpack::FeatureSelection

describe Frequency do

  before do
    @a = Frequency.new(FeatureSelection.data)
  end

  it "should return an hash" do
    @a.rank_features.should be_a(Hash)
  end

  describe "Should count how many times is occurs in spam" do
    it "should return 3" do
      @a.rank_features[:spam]['is'].should == 3
    end
  end

end
