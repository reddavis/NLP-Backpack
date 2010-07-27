require 'nlp_backpack/evaluations/base'

module NLPBackpack
  module Evaluation
    # = Confusion Matrix
    # Example:
    #
    # correct_results, test_results = [1,2,3], [3,2,1]
    # cm = NLPBackpack::ConfusionMatrix.new(correct_results, test_results)
    class ConfusionMatrix < Base
      # Pretty matrix output
      def inspect
        output = "rows: correct results; cols: test results\n\n"
        output << "\t" + all_unique_results.map {|x| "#{x}"}.join("\t") + "\n"

        all_unique_results.each do |correct_result|
          output << "#{correct_result}\t"
          all_unique_results.each do |test_result|
            result = results_for(correct_result, test_result)
            if test_result == correct_result
              output << "<#{result}>\t"
            else
              output << "#{result}\t"
            end
          end

          output << "\n"
        end

        output
      end

      # Returns a specific cell from the confusion matrix
      def results_for(correct_result, test_result)
        process[results_key(correct_result, test_result)]
      end

      # Returns a hash of confusions
      def process
        @results ||= begin
          results = Hash.new {|h,k| h[k] = 0.0}

          @correct_results.each_with_index do |correct_result, index|
            test_result = @test_results[index]
            results[results_key(correct_result, test_result)] += 1
          end

          # Calculate %
          results.each do |k, v|
            results[k] = "#{((v / results_count) * 100).round}%"
          end

          results
        end
      end

      private

      def results_key(correct_result, test_result)
        "#{correct_result}_#{test_result}"
      end

      def results_count
        @test_results.size
      end

      def all_unique_results
        (@test_results + @correct_results).uniq
      end
    end

  end
end