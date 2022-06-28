class CodeMaker
  @@colors = %w[yellow blue purple red green black]

  def initialize
    @secret_code = computer_choice
  end

  def computer_choice
    secret_code = []
    4.times do |i|
      secret_code[i] = @@colors.sample
    end
    secret_code
  end

  def display_code
    puts @secret_code
  end
end

game1 = CodeMaker.new
game1.display_code
