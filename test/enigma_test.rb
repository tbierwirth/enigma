require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keygen'
require './lib/offset'
require './lib/rotate'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @keygen = KeyGen.new
    @offset = Offset.new
    @rotate = Rotate.new
    @enigma = Enigma.new
  end

  def test_things_exists
    assert_instance_of KeyGen, @keygen
    assert_instance_of Offset, @offset
    assert_instance_of Rotate, @rotate
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_message
    assert_equal "keder ohulw", @enigma.encrypt("Hello world", "02715", "040895")
  end

end
