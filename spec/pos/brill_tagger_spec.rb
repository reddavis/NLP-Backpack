require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include NLPBackpack

describe POS::BrillTagger do
  before(:all) do
    @pos = POS::BrillTagger.analyze(text)
  end

  it "should properly tag 'the fast fox'" do
    @pos[0][1].should == "DT"
    @pos[1][1].should == "JJ"
    @pos[2][1].should == "NN"
  end

  it "should return a POSData object" do
    @pos.should be_a(POS::POSArray)
  end

  def text
    "This regular expression is read in the following manner: Zero or more adjectives or nouns, followed by an option group of a noun and a preposition, followed again by zero or more adjectives or nouns, followed by a single noun. A sequence of tags matching this pattern ensures that the corresponding words make up a noun phrase.
    In addition to simply pulling out the phrases, it is common to do some simple post processing to link variants together (For example, unpluralizing plural variants)."
  end
end
