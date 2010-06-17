require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/tokenizers/space'

include NLPBackpack

describe Tokenizer::Space do
  it "should split text by single spaces" do
    a = Tokenizer::Space.tokenize(text)
    a.size.should == 4
  end

  def text
    "hello  there this"
  end
end
