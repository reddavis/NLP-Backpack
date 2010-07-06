require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include NLPBackpack

describe GunningFogIndex do
  before do
    @gfi = GunningFogIndex.new(text)
  end

  it "should return a float" do
    @gfi.process.should be_a(Float)
  end

  describe "Word count" do
    it "should be 10" do
      @gfi.word_count.should == 10
    end
  end

  describe "Average sentence length" do
    it "should be 10/1" do
      @gfi.average_sentence_length.should == 10/1
    end
  end

  describe "Sentence count" do
    it "should be 1" do
      @gfi.sentence_count.should == 1
    end
  end

  describe "Complex word count" do
    it "should be 0" do
      @gfi.complex_word_count.should == 0
    end
  end

  private

  def text
    "once upon a time, there was a dog called jack."
  end
end
