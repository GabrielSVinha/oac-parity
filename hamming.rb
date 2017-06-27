class Hamming
  def encode(byte)
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
    first_pos = byte_array.each_index do |i|
      temp = []
      if [1,3,5,7,9,11].include?(i)
	temp.push(byte_array[i])
      end
      temp
    end
    first_pos
  end
end
