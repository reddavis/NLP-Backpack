# This ISNT actually the Flesch Index, but actually the syllable rules
# used when calculating the Flesch Index
# Read more: http://portal.acm.org/citation.cfm?id=10583

module NLPBackpack
  module Syllable

    class FleschIndex
      class << self
        def analyze(*words)
          new(*words).process
        end
      end

      def initialize(*words)
        @words = words
      end

      def process
        @results ||= calculate_syllables
      end

      private

      def calculate_syllables
        results = {}

        @words.each do |word|
          a_word = word.downcase

          results[word] = 1 && next if word.size <= 3

          a_word.sub!(/[es|ed|e]$/, "")
          syllables = a_word.scan(/[aeiouy]{1,2}/).size

          results[word] = syllables
        end

        results
      end
    end

  end
end