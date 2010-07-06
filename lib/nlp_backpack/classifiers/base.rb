module NLPBackpack
  module Classifier

    class Base
      class << self
        def load(db_path)
          data = ""
          File.open(db_path) do |f|
            while line = f.gets
              data << line
            end
          end
          Marshal.load(data)
        end
      end

      attr_accessor :db_filepath

      def save
        raise "You haven't set a db_filpath, I dont know where to save" if @db_filepath.nil?
        File.open(@db_filepath, "w+") do |f|
          f.write(Marshal.dump(self))
        end
      end
    end

  end
end