class KeyGen

  def key
    key = 5.times.map{rand(0..9)}
    key.join
  end

  def generate_shift(key)
    shift = []
    if key.class == Array
      key.each_cons(2){|a| shift << a.join}
    else
      key.chars.each_cons(2){|a| shift << a.join}
    end
    shift
  end

end
