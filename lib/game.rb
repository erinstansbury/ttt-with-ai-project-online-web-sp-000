class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      if board.turn_count.even?
          @player_1
        else
          @player_2
        end
      end

      def won?
          WIN_COMBINATIONS.collect do |winarray|
          win_index_1 = winarray[0]
          win_index_2 = winarray[1]
          win_index_3 = winarray[2]

          position_1 = board.cells[win_index_1]
          position_2 = board.cells[win_index_2]
          position_3 = board.cells[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return winarray
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return winarray
          end
        end
          false
        end

  def draw?
    if won? == false && board.full? == true
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      winarray = won?
      board.cells[winarray[0]]
    else
      nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board).to_i
    if board.valid_move?(input) == true
      board.update(input, current_player)
    else
      turn
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
    end
  end

end
