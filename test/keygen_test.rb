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

end
