module Players
  class Computer < Player

    def move(input)
      move_list = [5,1,3,7,9,2,4,6,8]
      # center = 5
      # corner = [1,3,7,9]
      # edge = [2,4,6,8]
      move_list.map do |x|
        binding.pry
        if !input.taken?(x)
          x
        end
      end
      #first priority is stop 3 in a row
      #selects center first
      #selects corner next
      #selects to finish row
      x
    end

  end
end
