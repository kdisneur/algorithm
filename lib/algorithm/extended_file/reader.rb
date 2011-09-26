module ExtendedFile
  class Reader
    def initialize file_name
      @file_name = file_name
      @line_in_use = 0
    end

    def next_line
      line = file[@line_in_use]
      @line_in_use = @line_in_use.succ
      line
    end

    def previous_line
      @line_in_use = @line_in_use.pred
      line = file[@line_in_use]
      line
    end

    def next_line?
      @line_in_use < file.length
    end

    def file
      @file ||= File.open(@file_name, 'r').readlines.collect {|line| line.strip}
    end
  end
end

