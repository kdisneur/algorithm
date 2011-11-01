require_relative '../configuration'
require_relative './keyword'

module Algorithm
  module Translator
    class Base

      def key_words
        @key_words ||= Configuration.instance["key_words"].collect do |key_word|
          name = key_word.shift
          params = key_word.first
          Keyword.new name, params["matcher"], params["replacement"], params["method_to_call"]
        end
      end

      def process_file output, input
        @output = output
        @input = input
        while @input.next_line? do
          line = @input.next_line
          process_line line
        end
      end

      def process_line line
        line.strip!
        return if line.empty?
        key_word = search_key_word line
        raise "No keyword has been recognized in line: \`#{line}\`" if key_word.nil?
        send "#{key_word.method}", key_word, line unless key_word.method.nil?
      end

      def search_key_word line
        key_words.select {|key_word| line.match key_word.matcher}.first
      end

      def search_key_word_by_name name
        key_words.select {|key_word| key_word.name == name }.first
      end

    end
  end
end

