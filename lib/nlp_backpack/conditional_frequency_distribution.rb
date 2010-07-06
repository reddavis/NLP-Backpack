module NLPBackpack
  # = Conditional Frequency Distribution
  # Example:
  #
  # speeches = {:speech_a => %w(trol lol lol lol), :speech_b => %w(facebook makes you pregnant)}
  # events = %w(lol makes)
  # cfd = NLPBackPack::ConditionalFrequencyDistributions.new(speeches, *events)
  # cfd.process => {:speech_a => {lol => 3, :makes => 0}, :speech_b => {:lol => 0, :makes => 1}}
  class ConditionalFrequencyDistribution
    def initialize(conditions, *events)
      @conditions = conditions
      @events = events
    end

    # Returns a hash of each condition with their event result
    def process
      @results ||= calculate_cfd
    end

    # Returns a pretty table output
    def inspect
      data = "\t#{@events.join("\t")}\n"

      process.each_pair do |condition, events|
        data << "#{condition}\t"
        @events.each {|e| data << "#{events[e]}\t"}
        data << "\n"
      end

      data
    end

    private

    def calculate_cfd
      results = build_hash

      @events.each do |event|
        @conditions.each_pair do |condition, data|
          results[condition][event] = data.select {|term| term == event}.size
        end
      end

      results
    end

    # Build a hash with the conditions as keys
    def build_hash
      hash = {}
      @conditions.each_key {|key| hash[key] = {}}
      hash
    end
  end

end