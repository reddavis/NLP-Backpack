require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include NLPBackpack

describe TypeTokenRatio do
  describe "Plain text" do
    before do
      @ld = TypeTokenRatio.analyze(text)
    end

    # 2 / 10 * 100
    it "should return 20" do
      @ld.should == 20
    end
  end

  describe "Punctuated text" do
    before do
      @ld = TypeTokenRatio.analyze(punctuated_text)
    end

    # 2 / 10 * 100
    it "should return 20" do
      @ld.should == 20
    end
  end

  private

  def text
    "a a a a a a a a b b"
  end

  def punctuated_text
    "a a; a : a a a. a a b b"
  end
end
