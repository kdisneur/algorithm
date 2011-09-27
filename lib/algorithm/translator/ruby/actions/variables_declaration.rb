module Algorithm
  module Translator
    module Ruby
      module Actions
        def variables_declaration key_word, line
          var_key_word = search_key_word_by_name "variable_declaration"
          while @input.next_line? do
            line = @input.next_line
            key_word = search_key_word_by_name "begin"
            return @input.previous_line if not key_word.nil? and line.match key_word.matcher
            line.gsub! var_key_word.matcher, var_key_word.replacement
            variables, type = line.split '|'
            variables.split(',').each do |variable|
              variable.strip!
              name, value = variable.split '='
              value = "nil" if value.nil?
              variables_recorded[name] = type_of type
              @output.write "#{name}=#{value}"
            end
          end
        end
      end
    end
  end
end

