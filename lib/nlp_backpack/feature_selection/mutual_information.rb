# Mutual Information measures how the much information
# presence/absence of a term contributes to making the correct
# classification

# Equation - for every class and term
#
# P(U=e(t), C=e(c)) * log2( P(U=e(t), C=e(c)) / P(U=e(t)) * P(C=e(c)) )

# We represent each function in the form - n(t,c)
# n(1,1) = count documents that have term and belong to specified class
# n(0,1) = count documents that do not have term and belongs to specified class
# n(1,0) = count documents that have term but do not belong to specified class
# n(0,0) = count documents that do not contain term and do not belong to specfied class
# n = n(1,1) + n(0,1) + n(1,0) + n(0,0)

require 'nlp_backpack/feature_selection/base'

module NLPBackpack
  module FeatureSelection

    class MutualInformation < Base

      def rank_features
        # Returns:
        #=> {:class => {'term' => score, 'term' => score}}
        @results = {}

        n = 1

        classes.each do |klass|
          @results[klass] = {}

          uniq_terms.each do |term|
            n += 1

            answer = calculate_contribution(term, klass)
            @results[klass][term] = answer
          end #terms.each
        end #classes.each
        @results
      end

      private

      def calculate_contribution(term, klass)
        calculate_section(term, klass, 1, 1) +
          calculate_section(term, klass, 1, 0) +
            calculate_section(term, klass, 0, 1) +
              calculate_section(term, klass, 0, 0)
      end

      def calculate_section(term, klass, t, c)
        n = count_documents
        n_1_0 = n_1_0(term, klass)
        n_0_1 = n_0_1(term, klass)

        begin
          if t == 1 && c == 1
            n_1_1 = n_1_1(term, klass)

            # return 0 if a == 0
            a = (n * n_1_1) / ((n_0_1 + n_1_1) * (n_1_1 + n_1_0))
            return 0.0 if a == 0

            n_1_1 / n *
              Math.log(a)
          elsif t == 1 && c == 0
            n_1_1 = n_1_1(term, klass)
            n_0_0 = n_0_0(term, klass)

            # return 0 if a == 0
            a = (n * n_1_0) / ((n_1_1 + n_0_1) * (n_0_1 + n_0_0))
            return 0.0 if a == 0

            n_1_0 / n *
              Math.log(a)
          elsif t == 0 && c == 1
            n_0_0 = n_0_0(term, klass)
            n_1_1 = n_1_1(term, klass)

            # return 0 if a == 0
            a = (n * n_0_1) / ((n_1_0 + n_0_0) * (n_1_1 + n_1_0))
            return 0.0 if a == 0

            n_0_1 / n *
              Math.log(a)
          elsif t == 0 && c == 0
            n_0_0 = n_0_0(term, klass)

            # return 0 if a == 0
            a = (n * n_0_0) / ((n_1_0 + n_0_0) * (n_0_1 + n_0_0))
            return 0.0 if a == 0

            n_0_0 / n *
              Math.log(a)
          end
        rescue ZeroDivisionError, Errno::EDOM #1.9 Infinity
          0.0
        end
      end

    end

  end
end