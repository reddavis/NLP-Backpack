module NLPBackpack
  module Evaluation

    class ConfusionMatrix
      # Example:
      # correct_answers = [:NN, :JJ, :NN, :NP]
      # test_results = [:JJ, :JJ, :NN, :NP]
      # ConfusionMatrix.new(correct_answers, test_results)
      def initialize(correct_results, test_results)
        @correct_results = correct_results
        @test_results = test_results
      end

      def results
        @results ||= begin
          results = Hash.new {|h,k| h[k] = 0.0}

          @correct_results.each_with_index do |correct_result, index|
            test_result = @test_results[index]
            results[results_key(correct_result, test_result)] += 1
          end

          # Calculate %
          results.each do |k, v|
            results[k] = "#{(v / results_count).round * 100}%"
          end

          results
        end
      end

      def inspect
        output = ""
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

      def results_for(correct_result, test_result)
        results[results_key(correct_result, test_result)]
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