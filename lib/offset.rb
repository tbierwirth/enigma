require 'date'

class Offset

  def date
    Date.today.strftime("%d%m%y")
  end

  def generate_offset(date)
    (date.to_i ** 2).to_s.split(//).last(4)
  end

  def generate_shift(keys, offsets)
    keys.map.with_index do |key, index|
      key.to_i + offsets[index].to_i
    end
  end

end
