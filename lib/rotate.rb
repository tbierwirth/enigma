require 'pry'
class Rotate

  def initialize()
    @chars = ("a".."z").to_a << " "
  end

  def find_character_index(char)
    @chars.index(char.downcase)
  end

  def get_character(index)
    @chars[index]
  end

  def shift_character(char, offset, unshift = false)
    if @chars.include?(char.downcase)
      index = find_character_index(char)
      unshift == false ? new_index = (index + offset) : new_index = (index - offset)
      shift = new_index % @chars.length
      get_character(shift)
    else char
    end
  end

end
