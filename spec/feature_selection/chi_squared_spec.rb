require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include NLPBackpack::FeatureSelection

describe ChiSquared do

  before do
    @a = ChiSquared.new(FeatureSelection.data)
  end

  it "should return an hash" do
    @a.rank_features.should be_a(Hash)
  end

  it "should give this a score of 48.0" do
    @a.rank_features[:spam]['this'].should == 48.0
  end

end
