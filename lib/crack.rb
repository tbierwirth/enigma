require 'pry'
class Crack
  attr_reader :possible_keys

  def initialize()
    @possible_keys = generate_keys
  end

  def generate_keys
    keys = (00000..99999).to_a
    possibles = keys.map do |key|
      "%05d" % key
    end
    possibles.shuffle
  end

end
