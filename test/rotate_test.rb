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

end
