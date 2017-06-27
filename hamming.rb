class Hamming
  def self.encode(byte)
    byte_array = byte.chars
    data = Array.new
    data[0] = ""
    data[1] = ""
    data[2] = byte_array[0]
    data[3] = ""
    data[4] = byte_array[1]
    data[5] = byte_array[2]
    data[6] = byte_array[3]
    data[7] = ""
    data[8] = byte_array[4]
    data[9] = byte_array[5]
    data[10] = byte_array[6]
    data[11] = byte_array[7]

    #For bit number 1
    first_pos = []
    $i = 0
    while $i <= data.size do
      first_pos.push(data[$i])
      $i += 2
    end
    data[0] = even_parity_bit first_pos
    
    sec_pos = []
    $i = 1
    while $i <= data.size do
      sec_pos.push(data[$i])
      sec_pos.push(data[$i+1])
      $i += 4
    end

    data[1] = odd_parity_bit sec_pos

    thir_pos = []
    $i = 3
    while $i <= data.size do
      thir_pos.push(data[$i])
      thir_pos.push(data[$i+1])
      thir_pos.push(data[$i+2])
      $i += 8
    end
    data[3] = odd_parity_bit thir_pos

    four_pos = []
    $i = 7
    while $i <= data.size do
      four_pos.push(data[$i])
      four_pos.push(data[$i+1])
      four_pos.push(data[$i+2])
      four_pos.push(data[$i+3])
      $i += 16
    end
    data[7] = even_parity_bit four_pos
    data.join()

  end

  def self.odd_parity_bit(value)
    n = value.count('1')
    bit = '0'
    if(n % 2 == 0)
      bit = '1'
    elsif(n%2 == 1)
      bit = '0'
    end
    bit
  end
  def self.even_parity_bit(value)
    n = value.count('1')
    bit = '0'
    if(n % 2 == 0)
      bit = '0'
    elsif(n%2 == 1)
      bit = '1'
    end
    bit
  end


end
