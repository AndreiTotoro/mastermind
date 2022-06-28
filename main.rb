module Colors
  def available_colors
    %w[yellow blue purple red green black]
  end
end

# Generates a random code for the computer each game and handles player choice
class CodeMaker
  include Colors
  def initialize
    @secret_code = computer_choice
  end

  def computer_choice
    @choice = []
    4.times do |i|
      @choice[i] = available_colors.sample
    end
    @choice
  end

  attr_reader :secret_code

  def display_code
    print @secret_code
  end
end

# Manages the game itself, checking wheter the guess of the payer is correct and keeping track of rounds
class GameManager
  include Colors
  def initialize
    @round = 1
  end

  def display_colors
    available_colors.each do |color|
      print "#{color} "
    end
    print "\n"
  end

  def code_craked_checker(computer_choice, player_choice)
    computer_choice == player_choice
  end

  def player_guess
    puts "Please make a guess, here are the available colors: \n"
    display_colors
    @guess = gets.chomp.split
  end

  def round_announcer
    "It is currently round number #{@round}. You have #{13 - @round} rounds remaining!"
  end

  def round_manager(computer_choice)
    if @round == 3
      puts 'You have failed guessing the code! Better luck next time!'
      return
    end
    puts round_announcer
    pguess = player_guess
    if code_craked_checker(computer_choice, pguess) == true
      puts 'You cracked the code!'
      return
    end
    choice_checker(computer_choice, pguess)
    round_manager(computer_choice)
  end

  def choice_checker(computer_choice, player_choice)
    player_choice.each_with_index do |color, index|
      if color == computer_choice[index]
        print 'perfect '
      elsif computer_choice.any?(color)
        print 'almost '
      else
        print 'wrong '
      end
    end
    print "\n"
    print "\n"
    @round += 1
  end
end

game1 = CodeMaker.new
game_manager = GameManager.new
game_manager.round_manager(game1.secret_code)

# to do:
# add a method to check if the playered entered exactly 4 colors and those colors are spelled correctly
# fix the fact that a color that is in place displays almost
# allow player to play a 12 round game
# make it so that the player loses if he gets to the 12th round
