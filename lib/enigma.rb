require './lib/keygen'
require './lib/offset'
require './lib/rotate'
require './lib/crack'
require 'pry'

class Enigma

  def initialize()
    @keygen = KeyGen.new
    @offset = Offset.new
    @rotate = Rotate.new
    @crack = Crack.new
  end

  def encrypt(message, key = @keygen.key, date = @offset.date)
    encrypted_message = []
    shift = @offset.generate_shift(@keygen.generate_shift(key.chars), @offset.generate_offset(date))
    message.chars.map.with_index do |char, index|
      encrypted_message << @rotate.shift_character(char, shift.first)
      shift.rotate!
    end
    {encryption: encrypted_message.join, key: key, date: date}
  end

  def decrypt(message, key, date = @offset.date)
    decrypted_message = []
    shift = @offset.generate_shift(@keygen.generate_shift(key.chars), @offset.generate_offset(date))
    message.chars.map.with_index do |char, index|
      decrypted_message << @rotate.shift_character(char, shift.first, true)
      shift.rotate!
    end
    {decryption: decrypted_message.join, key: key, date: date}
  end

  def crack(message, date = @offset.date)
    attempts = 0
    key = @crack.possible_keys.find do |key|
      attempts += 1
      decrypt(message, key, date)[:decryption].split(//).last(4).join.include?(" end")
    end
    {decryption: decrypt(message, key, date)[:decryption], key: key, date: date, attempts: attempts}
  end

end
