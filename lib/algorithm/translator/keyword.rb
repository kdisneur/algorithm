module Algorithm
  module Translator
    class Keyword
      attr_reader :name, :matcher, :replacement, :method

      def initialize name, matcher, replacement, method
        @name = name
        @matcher = /#{matcher}/i
        @replacement = replacement
        @method = method
      end
    end
  end
end

