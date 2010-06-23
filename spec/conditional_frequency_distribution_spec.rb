require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include NLPBackpack

describe ConditionalFrequencyDistribution do
  before do
    conditions = {:happy => happy_text, :sad => sad_text}
    @cfd = ConditionalFrequencyDistribution.new(conditions, "happy", "sad")
    @results = @cfd.process
  end

  it "should return a hash" do
    @results.should be_a(Hash)
  end

  describe "Happy condition" do
    it "should return 2 for happy" do
      @results[:happy]["happy"].should == 2
    end

    it "should return 0 for sad" do
      @results[:happy]["sad"].should == 0
    end
  end

  describe "Sad condition" do
    it "should return 0 for happy" do
      @results[:sad]["happy"].should == 0
    end

    it "should return 2 for sad" do
      @results[:sad]["sad"].should == 2
    end
  end

  describe "Tabulation" do
    it "should include the events" do
      table = @cfd.inspect
      table.should match(/happy/)
      table.should match(/sad/)
    end
  end

  private

  def happy_text
    %w{when happy things happen it makes me happy}
  end

  def sad_text
    %w{when sad things happen it makes me sad}
  end
end
