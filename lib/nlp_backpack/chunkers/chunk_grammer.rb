# ChunkGrammer
# Chunk Grammers are regex-esq patterns that indicate how sentences should be chunked
# The patterns are made up of Tag Patterns.
# (DT)?(JJ.*)* == Optional determiner, followed by zero or more of any type of adjective.

require 'nlp_backpack/chunkers/tag_pattern'

module NLPBackpack

  module Chunker
    class Retry < Exception; end;

    class ChunkGrammer

      def initialize(pattern)
        @pattern = prepare_pattern(pattern)

        @cached_pattern = @pattern.clone
        @cached_pattern.freeze

        @matched_patterns = []
        @potential_pattern = []
      end

      # Extract all matches
      def match(pos_array)
        next_pattern(:start)

        pos_array.each do |word|
          begin
            pos = word[1]

            if pos.match(@current_pattern.tag)
              @potential_pattern << word[0]
              next_pattern(:matched)
            else
              next_pattern(:no_match)
            end
          rescue Retry
            retry
          end
        end

        pop_potential_pattern!

        @matched_patterns.map {|pattern| pattern.join(" ") }
      end

      private

      def next_pattern(state)
        if @pattern.empty?
          reset_pattern!
          next_pattern(:start)
        end

        @current_pattern = case state
        when :start, :next
          @pattern.pop
        when :matched
          if ["+", "*"].include?(@current_pattern.conditions)
            @current_pattern
          else
            @pattern.pop
          end
        when :no_match
          if ["?", "*"].include?(@current_pattern.conditions)
            next_pattern(:next)
            raise Retry #Prob not the best way to do this(?)
          else
            # Start again
            reset_pattern!
            pop_potential_pattern!
            next_pattern(:start)
          end
        end
      end

      def pop_potential_pattern!
        if @potential_pattern.size >= minimum_potential_pattern_size
          @matched_patterns << @potential_pattern
        end

        reset_potential_pattern!
      end

      def reset_pattern!
        @pattern = @cached_pattern.dup
      end

      def reset_potential_pattern!
        @potential_pattern = []
      end

      def minimum_potential_pattern_size
        @cached_pattern.reject {|x| ["?", "*"].include?(x.conditions)}.size
      end

      # Extract patterns like (DT)? -- (JJ.*)*
      def prepare_pattern(pattern)
        pattern.scan(/(\<[^\>]+\>[^\<]?)/).flatten.map { |x| TagPattern.new(x) }.reverse
      end

    end
  end

end