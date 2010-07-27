require 'nlp_backpack/feature_selections/base'

module NLPBackpack
  module FeatureSelection

    class Frequency < Base

      def rank_features
        # Returns:
        #=> {:class => {'term' => count, 'term' => count}}
        @results = {}

        classes.each do |klass|
          @results[klass] = Hash.new {|h,k| h[k] = 0 }

          @data[klass].flatten.each do |term|
            @results[klass][term] += 1
          end
        end #classes.each

        @results
      end

      private

      # Overwrite Base#total_calculations
      def total_calculations
        classes.size * terms.size
      end

    end

  end
end