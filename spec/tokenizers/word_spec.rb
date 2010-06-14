require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/tokenizers/word'

describe Tokenizer::Word do
  it "should split text by words" do
    a = Tokenizer::Word.tokenize(text)
    a.size.should == 5
  end

  def text
    "hello; there, this. that you're"
  end
end
