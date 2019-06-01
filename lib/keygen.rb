class KeyGen

  def key
    key = 5.times.map{rand(0..9)}.join
  end

end
