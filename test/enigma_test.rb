require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keygen'
require './lib/offset'
require './lib/rotate'

class EnigmaTest < Minitest::Test

  def setup
    @keygen = KeyGen.new
    @offset = Offset.new
    @rotate = Rotate.new
  end

  def test_things_exists
    assert_instance_of KeyGen, @keygen
    assert_instance_of Offset, @offset
    assert_instance_of Rotate, @rotate
  end

end