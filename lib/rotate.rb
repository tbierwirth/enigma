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

end
