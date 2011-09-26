module Translator
  module Ruby
    module Actions
      def read key_word, line
        line.gsub! key_word.matcher, key_word.replacement
        type, method = variables_recorded[line]
        @output.write "#{line} = gets.chomp.#{method}"
      end
    end
  end
end

