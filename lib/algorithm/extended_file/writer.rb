module Algorithm
  module ExtendedFile
    class Writer
      def initialize file_name
        @file_name = file_name
      end

      def write line
        file.write "#{line}\n"
      end

      def file
        @file ||= File.open @file_name, 'w'
      end
    end
  end
end

