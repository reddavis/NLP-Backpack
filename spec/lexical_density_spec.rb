require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include NLPBackpack

describe LexicalDensity do
  it "should return 50" do
    LexicalDensity.analyze(text).should == 50
  end

  def text
    # 3 (cat, sat, mat) / 6 * 100
    "The cat sat on the mat"
  end
end