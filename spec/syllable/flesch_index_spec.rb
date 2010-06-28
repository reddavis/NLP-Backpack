require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include NLPBackpack

describe Syllable::FleschIndex do
  before do
    @fi = Syllable::FleschIndex.analyze(*text)
  end

  it "should return an integer" do
    @fi["hello"].should be_a(Integer)
  end

  it "should return 2" do
    @fi["hello"].should == 2
  end

  def text
    %w{hello and there and this}
  end
end
