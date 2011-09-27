require_relative '../../../../lib/algorithm/extended_file/reader'
require 'test/unit'

class TestReader < Test::Unit::TestCase

  def setup
    super
    file_to_load = File.dirname(__FILE__) + "/../../../files/algorithm/extended_file/reader.txt"
    @input = Algorithm::ExtendedFile::Reader.new file_to_load
  end

  def test_should_be_able_to_get_a_file
    assert @input.file.instance_of? Array
    expected_result = [ "line1", "line2", "line3", ""]
    assert_equal expected_result, @input.file
  end

  def test_should_be_able_to_read_next_line
    assert @input.next_line, "line1"
  end

  def test_should_be_able_to_get_previous_line
    @input.next_line
    @input.next_line
    assert @input.previous_line, "line2"
  end

  def test_should_be_able_to_get_last_line_when_we_call_previous_line_on_first_line
    @input.previous_line
    assert @input.previous_line, "line3"
  end

  def test_should_be_able_to_have_next_line
    assert_equal @input.next_line?, true
  end

  def test_should_not_be_able_to_have_next_line_when_file_is_finished
    4.times { @input.next_line }
    assert_equal @input.next_line?, false
  end

end

