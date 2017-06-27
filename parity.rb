class Parity
  def self.error?(value, parity)
    error = false
    uppers = value.count("1")
    if(uppers % 2 == 0 and parity == "impar")
      error = true
    elsif(uppers % 2 == 1 and parity == "par")
      error = true
    end
    error
  end
end
