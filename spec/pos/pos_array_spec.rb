require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nlp_backpack/pos/pos_array'

describe POS::POSArray do
  before do
    @pos_a = POS::POSArray.new
  end

  describe "Appending words" do
    describe "Using <<" do
      it "should raise an error if we insert too much data" do
        lambda do
          @pos_a << ["hello", :NN, "LOL"]
        end.should raise_error
      end

      it "size should be 2" do
        2.times { @pos_a << word }
        @pos_a.size.should == 2
      end
    end

    describe "Using #append" do
      it "size should be 2" do
        2.times { @pos_a.append(*word) }
        @pos_a.size.should == 2
      end
    end
  end

  describe "to_s" do
    it "should return properly formed string for ChunkGrammer" do
      @pos_a << word
      @pos_a << word

      @pos_a.to_s.should == "hello/NN hello/NN"
    end
  end

  def word
    ["hello", :NN]
  end
end
