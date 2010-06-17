require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/tokenizers/whitespace'

include NLPBackpack

describe Tokenizer::Whitespace do
  it "should split text by whitespace" do
    a = Tokenizer::Whitespace.tokenize(text)
    a.size.should == 3
    a[0].should == "hello"
  end

  def text
    "hello there this"
  end
end
