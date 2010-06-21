module NLPBackpack
  module FeatureSelection

    class Base
      def initialize(data, options={})
        @data = data
      end

      def classes
        @classes ||= find_all_classes
      end

      private

      # Contains term and belongs to class
      def n_1_1(term, klass)
        @n_1_1 = pre_compute_n_1_1 unless @n_1_1

        @n_1_1[klass][term]
      end

      def pre_compute_n_1_1
        results = {}

        # Logger
        n = 1

        classes.each do |q_klass|
          results[q_klass] = {}

          uniq_terms.each do |term|
            n += 1
            count = 0.0

            @data.each_pair do |klass, documents|
              if klass == q_klass
                documents.each do |document|
                  count += 1 if document.include?(term)
                end
              end
            end

            results[q_klass][term] = count
          end
        end

        results
      end

      # Contains term but does not belong to class
      def n_1_0(term, klass)
        @n_1_0 = pre_compute_n_1_0 unless @n_1_0

        @n_1_0[klass][term]
      end

      # Pre-Computer n_1_0
      def pre_compute_n_1_0
        results = {}

        # Logger
        n = 1

        classes.each do |q_klass|
          results[q_klass] = {}

          uniq_terms.each do |term|
            n += 1
            count = 0.0

            @data.each_pair do |klass, documents|
              if klass != q_klass
                documents.each do |document|
                  count += 1 if document.include?(term)
                end
              end
            end

            results[q_klass][term] = count
          end
        end

        results
      end

      # Does not contain term but belongs to class
      def n_0_1(term, klass)
        @n_0_1 = pre_compute_n_0_1 unless @n_0_1

        @n_0_1[klass][term]
      end

      # Pre-Computer n_0_1
      def pre_compute_n_0_1
        results = {}

        # Logger
        n = 1

        classes.each do |q_klass|
          results[q_klass] = {}

          uniq_terms.each do |term|
            n += 1
            count = 0.0

            @data.each_pair do |klass, documents|
              if klass == q_klass
                documents.each do |document|
                  count += 1 if !document.include?(term)
                end
              end
            end

            results[q_klass][term] = count
          end
        end

        results
      end

      # Does not contain term and does not belong to class
      def n_0_0(term, klass)
        @n_0_0 = pre_compute_n_0_0 unless @n_0_0

        @n_0_0[klass][term]
      end

      # Pre-Computes all n_0_0 queries
      def pre_compute_n_0_0
        results = {}

        # Logger
        n = 1

        classes.each do |q_klass|
          results[q_klass] = {}

          uniq_terms.each do |term|
            n += 1
            count = 0.0

            @data.each_pair do |klass, documents|
              if klass != q_klass
                documents.each do |document|
                  count += 1 if !document.include?(term)
                end
              end
            end

            results[q_klass][term] = count
          end
        end

        results
      end

      # All of the counts added together
      def count_documents
        size = 0
        @data.each_value do |documents|
          size += documents.size
        end

        size
      end

      def find_all_classes
        @data.map {|x| x[0]}
      end

      def uniq_terms
        @uniq_terms ||= @data.map {|x| x[1]}.flatten.uniq
      end

      def terms
        @terms ||= @data.map {|x| x[1]}.flatten
      end

      def total_calculations
        @total_calculations ||= uniq_terms.size * classes.size
      end

    end

  end
end