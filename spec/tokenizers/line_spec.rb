require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/tokenizers/line'

include NLPBackpack

describe Tokenizer::Line do
  it "should split text by whitespace" do
    a = Tokenizer::Line.tokenize(text)
    a.size.should == 3
  end

  def text
    "hello\n\nthere this"
  end
end
