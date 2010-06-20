require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include NLPBackpack

describe StopWords do
  before(:all) { @stop_words = StopWords.all }

  it "should return z" do
    @stop_words.last.should == "z"
  end

  it "should return a" do
    @stop_words.first.should == "a"
  end
end