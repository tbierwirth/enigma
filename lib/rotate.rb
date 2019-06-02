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

  def shift_character(char, offset)
    index = find_character_index(char)
    new_index = index + offset
    shift = new_index % @chars.length
    get_character(shift)
  end

  def unshift_character(char, offset)
    index = find_character_index(char)
    new_index = (offset - index).abs
    shift = new_index % @chars.length
    get_character(shift)
  end

end
