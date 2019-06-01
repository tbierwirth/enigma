class KeyGen

  def key
    key = 5.times.map{rand(0..9)}
  end

  def generate_shift
    shift = []
    key.each_cons(2){|a| shift << a.join}
    shift
  end

end
