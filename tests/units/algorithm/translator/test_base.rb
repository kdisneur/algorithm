require_relative '../../../../lib/algorithm/translator/base'
require 'test/unit'

class TestBase < Test::Unit::TestCase

  def setup
    super
    @base = Translator::Base.new
  end

  def test_should_be_able_to_get_key_words
    assert @base.key_words.length == 16
    @base.key_words.each {|keyword| assert keyword.instance_of? Translator::Keyword}
  end

  def test_should_be_able_to_find_key_word_in_line
    line = "algo calculatetaxes"
    assert @base.search_key_word(line).name == "algo"
  end

  def test_should_be_able_to_find_key_word_by_name
    name = "algo"
    assert @base.search_key_word_by_name(name).name == "algo"
  end

  def test_should_raise_an_runtime_exception_when_process_line_don_t_find_key_word_in_line
    line = "a line which contains no keyword"
    assert_raises (RuntimeError) { @base.process_line line }
  end

  def test_should_not_raise_an_runtime_exception_when_process_line_find_key_word_in_line
    line = "algo line_which_contains_keyword"
    assert_raises (NoMethodError) { @base.process_line line }
  end

end

