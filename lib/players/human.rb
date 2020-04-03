class Player::Human < Player
    def move(board)
      puts "choose a number between 1-9"
      gets.strip
    end
  end
