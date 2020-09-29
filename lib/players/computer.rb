module Players
  class Computer < Player

    def move(input)
      move_list = (1..9)
      center = 5
      corner = [1,3,7,9]
      edge = [2,4,6,8]
      binding.pry
      if !input.taken?(5)
        5
      elsif input.taken?(corner.random)
      end
      #first priority is stop 3 in a row
      #selects center first
      #selects corner next
      #selects to finish row
      #
    end

  end
end
