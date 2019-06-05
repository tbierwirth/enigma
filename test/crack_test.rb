require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keygen'
require './lib/crack'

class CrackTest < Minitest::Test

  def setup
    @crack = Crack.new
  end

  def test_it_exists
    assert_instance_of Crack, @crack
  end

  def test_possible_keys
    assert_equal 100000, @crack.possible_keys.uniq.count
  end

end
