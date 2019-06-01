require 'date'

class Offset

  def date
    Date.today.strftime("%d%m%y")
  end

  def generate_offset
    (date.to_i ** 2).to_s.split(//).last(4).join
  end

end
