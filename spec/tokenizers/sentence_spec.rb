require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include NLPBackpack

describe Tokenizer::Sentence do
  it "should split text by words" do
    a = Tokenizer::Sentence.tokenize(text)
    a.size.should == 2
  end

  def text
    "hello; there, this. that you're"
  end
end
