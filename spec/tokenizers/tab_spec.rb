require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/tokenizers/tab'

describe Tokenizer::Tab do
  it "should split text by single tabs" do
    a = Tokenizer::Tab.tokenize(text)
    a.size.should == 4
  end

  def text
    "hello\tthere\t\tthis"
  end
end
