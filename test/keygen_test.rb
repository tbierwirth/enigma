require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keygen'

class KeyGenTest < Minitest::Test

  def setup
    @keygen = KeyGen.new
  end

  def test_it_exists
    assert_instance_of KeyGen, @keygen
  end

  def test_for_five_digits
    assert_equal 5, @keygen.key.length
  end

  def test_is_random
    num_1 = @keygen.key
    num_2 = @keygen.key

    assert num_1 != num_2
  end

  def test_size_of_shift_generated
    key = @keygen.key
    assert_equal 4, @keygen.generate_shift(key).length
  end

end
