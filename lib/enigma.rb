require './lib/keygen'
require './lib/offset'
require './lib/rotate'

class Enigma

  def initialize()
    @keygen = KeyGen.new
    @offset = Offset.new
    @rotate = Rotate.new
  end

  def encrypt(message, key = @keygen.key, date = @offset.date)
    encrypted_message = []
    shift = @offset.generate_shift(@keygen.generate_shift(key.chars), @offset.generate_offset(date))
    message.chars.map.with_index do |char, index|
      encrypted_message << @rotate.shift_character(char, shift.first)
      shift.rotate!
    end
    hash = {encryption: encrypted_message.join, key: key, date: date}
  end

  def decrypt(message, key, date = @offset.date)
    decrypted_message = []
    shift = @offset.generate_shift(@keygen.generate_shift(key.chars), @offset.generate_offset(date))
    message.chars.map.with_index do |char, index|
      decrypted_message << @rotate.shift_character(char, shift.first, unshift = true)
      shift.rotate!
    end
    hash = {decryption: decrypted_message.join, key: key, date: date}
  end

end
