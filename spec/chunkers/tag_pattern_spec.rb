require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/chunker/tag_pattern'

include NLPBackpack

describe Chunker::TagPattern do
  describe "Tag" do
    before do
      @tp = Chunker::TagPattern.new("<NN>")
    end

    it "should return the tag as NN" do
      @tp.tag.should == /NN/
    end
  end

  describe "Tag with condition" do
    before do
      @tp = Chunker::TagPattern.new("<NN*>")
    end

    it "should return the tag as NN*" do
      @tp.tag.should == /NN*/
    end
  end

  describe "Tag with external condition" do
    before do
      @tp = Chunker::TagPattern.new("<NN.+>?")
    end

    it "should return the tag as NN" do
      @tp.tag.should == /NN.+/
    end

    it "should return conditions as ?" do
      @tp.conditions.should == "?"
    end
  end
end
