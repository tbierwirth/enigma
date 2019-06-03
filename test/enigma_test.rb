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

  def test_encrypt_message_with_key_date
    encryption = {
     encryption: "keder ohulw",
     key: "02715",
     date: "040895"
    }
    assert_equal encryption, @enigma.encrypt("Hello world", "02715", "040895")
  end

  def test_encrypt_message_with_key_no_date
    encryption = {
     encryption: "mfhatasdwm ",
     key: "02715",
     date: "020619"
    }
    assert_equal encryption, @enigma.encrypt("Hello world", "02715")
  end

  def test_encrypt_message_with_no_key_no_date
    encryption = {
     encryption: "mfhatasdwm ",
     key: "02715",
     date: "020619"
    }
    assert_equal encryption, @enigma.encrypt("Hello world")
  end

end
