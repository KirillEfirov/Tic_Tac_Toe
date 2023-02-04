class Field
    attr_accessor :array, :winner
    
    def initialize
      @array = [[1,2,3], [4,5,6], [7,8,9]]
      @winner = false
    end

    def change_field(move, sigil)
      @array.each do |arr|
        arr.each_with_index { |item, index| arr[index] = sigil if item == move }
      end
    end

    def display_field
      @array.each_with_index do |item, index|
        puts item.each { |elem| elem }.join("_|_")
      end
    end

    def check_rows(sigil1, sigil2)
      @array.each { |arr| @winner = true if (arr.all?(sigil1) || arr.all?(sigil2)) }
    end

    def check_columns(sigil1, sigil2)
      @array.each_with_index do |arr, index|
        counter = 0
        arr.each_with_index do |item, ind|  
          counter += 1 if @array[ind][index] == @array[index][index]
          
          @winner = true if counter == 3
        end
      end
    end

    def check_diagonals(sigil1, sigil2)
      @array.each_with_index do |arr, index|
        main = 0
        arr.each_with_index do |item, ind|  
          main += 1 if @array[index][index] == @array[ind][ind]

          @winner = true if main == 3
        end
      end

      @winner = true if @array[0][2] == @array[2][0] && @array[0][2] == @array[1][1]
    end

    def is_draw?
      @array.flatten.all?(String)
    end

    def include_move?(move)
      @array.flatten.include?(move)
    end
end