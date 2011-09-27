require_relative '../../../../lib/algorithm/extended_file/writer'
require 'test/unit'

class TestWriter < Test::Unit::TestCase

  def setup
    super
    @file_name = File.dirname(__FILE__) + "/../../../files/algorithm/extended_file/writer.txt"
    @output = Algorithm::ExtendedFile::Writer.new @file_name
  end

  def test_should_have_an_instance_of_file_behind_testwriter
    assert @output.file.instance_of? File
  end

  def test_should_be_able_to_write
    @output.write "line1"
    @output.file.close
    file_lines = File.open(@file_name, 'r').readlines.collect {|line| line.strip}
    expected_lines = ["line1"]
    assert_equal expected_lines, file_lines
  end

end

