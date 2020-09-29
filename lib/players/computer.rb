module Players
  class Computer < Player

    def move(input)
      move_list = ["5","1","3","7","9","2","4","6","8"]
      # center = 5
      # corner = [1,3,7,9]
      # edge = [2,4,6,8]
      optional_moves = []
      move_list.map do |x|
        if !input.taken?(x)
          optional_moves << x
        end
      end
      optional_moves.first
    end

  end
end
