require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/chunkers/regex_chunker'
require 'nlp_backpack/pos/pos_array'

include NLPBackpack

describe Chunker::RegexChunker do
  describe "Matching specified chunks" do
    before do
      @pos_a = POS::POSArray.new
      sentence.each {|word| @pos_a << word}
    end

    describe "Simple chunk" do
      it "should return 'this is some text'" do
        grammer = Chunker::RegexChunker.new("<DT><VBZ><DT><NN>")
        grammer.match(@pos_a).first.should == "this is some text"
      end
    end

    describe "Chunk with conditional tag" do
      it "should return 'this is some text'" do
        grammer = Chunker::RegexChunker.new("<DT><VBZ>?<DT>")
        grammer.match(@pos_a)[0].should == "this is some"
        grammer.match(@pos_a)[1].should == "this some"
      end

      it "should return 'this is some text'" do
        grammer = Chunker::RegexChunker.new("<DT><VBZ>*<DT>")
        grammer.match(@pos_a)[0].should == "this is some"
        grammer.match(@pos_a)[1].should == "this some"
      end
    end

    describe "Chunk with tag regex" do
      it "should return 'this is some text'" do
        grammer = Chunker::RegexChunker.new('<D\w><VBZ>?<DT>')
        grammer.match(@pos_a)[0].should == "this is some"
        grammer.match(@pos_a)[1].should == "this some"
      end
    end
  end

  def sentence
    [["this", "DT"], ["is", "VBZ"], ["some", "DT"], ["text", "NN"], ["text", "NN"], ["that", "IN"], ["I", "PRP"], ["want", "VBP"], ["analyzing", "VBG"], ["this", "DT"], ["some", "DT"]]
  end
end
