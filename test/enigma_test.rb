require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
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
    Offset.any_instance.stubs(:date).returns("020619")
    assert_equal encryption, @enigma.encrypt("Hello world", "02715")
  end

  def test_encrypt_message_with_no_key_no_date
    encryption = {
     encryption: "bhcxicn lov",
     key: "45665",
     date: "020619"
    }
    KeyGen.any_instance.stubs(:key).returns("45665")
    Offset.any_instance.stubs(:date).returns("020619")
    assert_equal encryption, @enigma.encrypt("Hello world")
  end

  def test_decrypt_message
    decryption = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal decryption, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_decrypt_message_no_date
    decryption = {
      decryption: "hello world",
      key: "02715",
      date: "020619"
    }
    Offset.any_instance.stubs(:date).returns("020619")
    assert_equal decryption, @enigma.decrypt("mfhatasdwm ", "02715")
  end

  def test_generate_date
    assert_equal Date.today.strftime("%d%m%y"), @offset.date
  end

  def test_crack_key
    expected = {
     decryption: "hello world end",
     key: "08304",
     date: "291018",
     attempts: @enigma.crack("vjqtbeaweqihssi", "291018")[:attempts]
   }
   Offset.any_instance.stubs(:date).returns("291018")
   assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
  end

  def test_crack_key_no_date
    expected = {
     decryption: "hey my name is tyler!!! end",
     key: "47560",
     date: "040619",
     attempts: @enigma.crack("d fgithuxhmgenh ugmy!!!gail")[:attempts]
   }
   Offset.any_instance.stubs(:date).returns("040619")
   assert_equal expected, @enigma.crack("d fgithuxhmgenh ugmy!!!gail")
  end

end
