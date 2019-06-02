require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotate'

class RotateTest < Minitest::Test

  def setup
    @rotate = Rotate.new
  end

  def test_it_exists
    assert_instance_of Rotate, @rotate
  end

  def test_find_character_index
    assert_equal 4, @rotate.find_character_index("E")
  end

  def test_get_character
    assert_equal "e", @rotate.get_character(4)
  end

  def test_shift_character
    assert_equal "h", @rotate.shift_character('e', 3)
    assert_equal "b", @rotate.shift_character('z', 3)
  end

end
