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

end
