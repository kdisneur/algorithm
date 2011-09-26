module Translator
  module Ruby
    module Actions
      def for_loop key_word, line
        line.gsub! key_word.matcher, key_word.replacement
        var, initial_value, end_value, increment = line.split(' ')
        increment = 1 if increment.nil?
        @output.write "#{var} = #{initial_value}"
        sigle = initial_value.to_i <= end_value.to_i ? "<=" : ">="
        @output.write "while #{var} #{sigle} #{end_value} do"
        while @input.next_line? do
          line = @input.next_line
          key_word = search_key_word_by_name "end_for"
          break if not key_word.nil? and line.match key_word.matcher
          process_line line
        end
        @output.write "#{var} = #{var} + (#{increment})"
        @output.write "end"
      end
    end
  end
end

