class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS  = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_counter
    turn_counter = 0
    @board.cells.map do |x|
      if x == "X" || x == "O"
        turn_counter += 1
      end
    end
    turn_counter
  end

  def current_player
    if turn_counter % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    result = false
    WIN_COMBINATIONS.map do |combo|
      check_array = []
      combo.map do |int|
        check_array << @board.cells[int]
      end
      if check_array[0] == check_array[1] && check_array[1] == check_array[2] && check_array[0] != " "
        result = combo
      end
    end
    result
  end

  def over?
    @board.full?
  end

  def draw?
    self.over? && !self.won?
  end

  def winner
    if self.won?
      winner = @board.cells[self.won?[0]]
    end
  end

  def turn
    puts @board
    requested_move = current_player.move(@board)
    while !@board.valid_move?(requested_move)
      puts "invalid"
      requested_move = current_player.move(@board)
    end
    @board.update(requested_move, current_player)
  end

  def play
    until self.won? || self.draw?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat\'s Game!"
    end
  end



  def self.start
    puts ""
    puts "Welcome to TicTacToe!"
    puts ""
    puts "Would you like to play with 0, 1 or 2 players?"
    inp = gets
    until inp == "exit"
      inp = gets
      if inp.to_i == 0
        Game.new(Players::Computer.new("X"),Players::Computer.new("O")).play
      elsif inp.to_i == 1
        Game.new(Players::Human.new("X"),Players::Computer.new("O")).play
      else
      puts "Please decide who wants to be 'X' and go first."
        Game.new(Players::Human.new("X"),Players::Human.new("O")).play
      end
      puts "Thanks for playing!"
      puts "You can exit by typing 'exit' or simply hit enter to play again!"
      inp = gets

    end




  end

end
