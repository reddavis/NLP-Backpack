module NLPBackpack

  class FrequencyDistribution
    def initialize(conditions, *events)
      @conditions = conditions
      @events = events
    end

    def process
      @results ||= calculate_cfd
    end

    def to_tabulation
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