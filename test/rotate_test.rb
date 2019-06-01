require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keygen'
require './lib/offset'
require './lib/rotate'

class RotateTest < Minitest::Test

  def setup
    @rotate = Rotate.new
  end

  def test_it_exists
    assert_instance_of Rotate, @rotate
  end

end
