module NLPBackpack
  module Evaluation

    class Base
      def initialize(correct_results, test_results)
        @correct_results = correct_results
        @test_results = test_results
      end
    end

  end
end