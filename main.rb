# Generates a random code for the computer each game and handles player choice
class CodeMaker
  def initialize
    @colors = %w[yellow blue purple red green black]
    @secret_code = computer_choice
  end

  def computer_choice
    @choice = []
    4.times do |i|
      @choice[i] = @colors.sample
    end
    @choice
  end

  attr_reader :secret_code

  def display_colors
    @colors.each do |color|
      print "#{color} "
    end
    print "\n"
  end

  def display_code
    print @secret_code
  end

  def player_guess
    puts "Please make a guess, here are the available colors: \n"
    display_colors
    @guess = gets.chomp.split
  end
end

# Manages the game itself, checking wheter the guess of the payer is correct and keeping track of rounds
class GameManager
  def initialize
    @round = 0
  end

  def choice_cheker(computer_choice, player_choice)
    player_choice.each_with_index do |color, index|
      if color == computer_choice[index]
        print 'perfect '
      elsif computer_choice.any?(color)
        print 'almost '
      else
        print 'wrong '
      end
      @round += 1
    end
  end
end

game1 = CodeMaker.new
game_manager = GameManager.new
game_manager.choice_cheker(game1.secret_code, game1.player_guess)
game1.display_code

# to do:
# add a method to check if the playered entered exactly 4 colors and those colors are spelled correctly
# add a method to check for victory
# allow player to play a 12 round game
# make it so that the player loses if he gets to the 12th round
