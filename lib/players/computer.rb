module Players
  class Computer < Player

    WIN_COMBINATIONS  = [
      [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
    ]

    def move(input)
      move_list = ["5","1","3","7","9","2","4","6","8"]
      optional_moves = []
      move_list.map do |x|
        if !input.taken?(x)
          optional_moves << x
        end
      end
      occupied_spaces = []
      input.cells=[" ", "X", " ", "X", " ", " ", " ", "X", " "]
      input.cells.each_with_index do |x, index|
        if x == self.token
          occupied_spaces << index
        end
      end
      # binding.pry
      good_chance = []
      WIN_COMBINATIONS.each do |x|
        x.map do |y|
          if occupied_spaces.include?(y)
            good_chance << x
          end
        end
      end
      binding.pry
      # optional_moves.first
    end



  end
end
