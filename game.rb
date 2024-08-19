class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def play
    while @player1.lives > 0 && @player2.lives > 0
      question = Question.new
      puts question.ask_question(@current_player)
      answer = gets.chomp

      if question.correct_answer?(answer)
        puts "Yes! You are correct."
      else
        puts "Seriously? No!"
        @current_player.lose_life
      end

      show_scores
      switch_player
    end
    game_over
  end

  def show_scores
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
    puts "_____NEW TURN _____"
  end

  def game_over
    winner = @player1.lives > 0 ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "_____GAME OVER _____"
    puts "Good bye Dayooooo!! 💪💪💪"
  end
end
