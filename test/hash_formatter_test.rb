require 'minitest/autorun'
require 'hash_formatter'

class HashFormatterTest < Minitest::Test
  def test_should_format_to_18_hash
    input = "{foo: 'bar'}"
    expected = '{:foo => "bar"}'
    hf = HashFormatter.new(input)
    assert_equal expected, hf.to_18
  end

  def test_should_format_to_19_hash
    input = "{:foo => 'bar'}"
    expected = '{foo: "bar"}'
    hf = HashFormatter.new(input)
    assert_equal expected, hf.to_19
  end

  def test_should_format_to_multiline_hash
    input = "{:foo => 'bar', a => 'b'}"
    expected = %Q|{\n  :foo => "bar",\n  a    => "b"\n}|
    hf = HashFormatter.new(input)
    assert_equal expected, hf.to_multiline
  end
end
