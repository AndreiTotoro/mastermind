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
    print "#{@guess}\n"
  end
end

game1 = CodeMaker.new
game1.player_guess
