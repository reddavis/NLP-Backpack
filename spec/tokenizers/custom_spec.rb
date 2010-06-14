require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/tokenizers/custom'

describe Tokenizer::Custom do
  describe "split by ands" do
    it "should return 3" do
      a = Tokenizer::Custom.tokenize(text, "and")
      a.size.should == 3
    end
  end

  describe "split by any character" do
    it "should return 3" do
      a = Tokenizer::Custom.tokenize("and", //)
      a.size.should == 3
    end
  end

  def text
    "hello and there and this"
  end
end
