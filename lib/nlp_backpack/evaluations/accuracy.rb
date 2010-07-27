require 'nlp_backpack/evaluations/base'

module NLPBackpack
  module Evaluation

    class Accuracy < Base

      def accuracy_of(klass)
        process[klass]
      end

      def inspect
        output = ""

        process.each do |klass, result|
          output << "#{klass}: #{result}% correct\n"
        end

        output
      end

      def process
        @results ||= begin
          correct_klass_count = Hash.new {|h,k| h[k] = 0.0}
          total_klass_count = Hash.new {|h,k| h[k] = 0.0}

          @correct_results.each_with_index do |correct_result, index|
            total_klass_count[correct_result] += 1
            correct_klass_count[correct_result] += 1 if correct_result == @test_results[index]
          end

          results = Hash.new

          total_klass_count.each do |klass, total_count|
            results[klass] = (correct_klass_count[klass] / total_count * 100).round
          end

          results
        end
      end
    end

  end
end