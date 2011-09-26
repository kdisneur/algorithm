require_relative '../../../../lib/algorithm/translator/keyword'
require 'test/unit'

class TestKeyword < Test::Unit::TestCase

  def setup
    super
    @keyword = Translator::Keyword.new "my_keyword", "^my_keyword (.*)$", "\\1", "my_keyword_function"
  end

  def test_should_respond_to
    [:name, :matcher, :replacement, :method].each {|attribute| assert_respond_to @keyword, attribute}
  end

  def test_should_not_change_attribute_value
    ["name=", "matcher=", "replacement=", "method="].each {|attribute| assert_raises(NoMethodError) {@keyword.send attribute, "change?"}}
  end
end

