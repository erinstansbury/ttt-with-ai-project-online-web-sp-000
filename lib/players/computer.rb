module Players
  class Computer < Player
    def move(board, counter = 0)
      spot = rand(1..10)
        if !board.full? && spot.valid_move?
          update
        end
    end
  end
end
