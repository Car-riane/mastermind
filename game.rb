class Game
  COLORS = %w[red orange yellow green blue purple]
  def initialize
    @secret_code = generate_code
    @max_attempts = 12
  end 
  
  def play 
    puts "Welcome to Mastermind!"
    puts "Try to guess the 4-digit secret code. Each digit is between 1 and 6"

    @max_attempts.times do |attempt|
      print "Attempt #{attempt + 1}: Enter  your guess (4digits, e.g., 1234):"
      guess = gets.chomp

      if valid_guess(guess)
        if guess == @secret_code
          puts "You cracked the code!"
          return 
        else 
          feedback = give_feedback(guess)
          puts "Feedback: #{feedback}"
        end 
      else 
        puts "Invalid Guess"
      end 
       puts "Game over! The secret code was #{@secret_code}."
    end 
  end 
end 