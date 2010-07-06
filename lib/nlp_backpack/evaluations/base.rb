module NLPBackpack
  module Evaluation
    # = Base
    # A guideline to adding more evaluations.
    class Base
      def initialize(correct_results, test_results)
        @correct_results = correct_results
        @test_results = test_results
      end

      def inspect
        raise Error::NotImplemented
      end

      def process
        raise Error::NotImplemented
      end
    end

  end
end