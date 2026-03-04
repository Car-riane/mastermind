class Game
  COLORS = %w[r g b y p o]

  def initialize
    @secret_code = COLORS.sample(4)
    @max_turns = 12
  end

  def play
    puts "Welcome to Mastermind!"
    puts "Colors available: #{COLORS.join(', ')}"
    puts "Guess the 4-color secret code. You have #{@max_turns} attempts."

    @max_turns.times do |turn|
      puts "\nAttempt #{turn + 1} of #{@max_turns}:"
      player_guess = get_guess

      red_pegs, white_pegs = evaluate_guess(player_guess)

      puts "Red pegs (right color, right position): #{red_pegs}"
      puts "White pegs (right color, wrong position): #{white_pegs}"

      if red_pegs == 4
        puts "\nYou cracked the code! Well done!"
        return
      end
    end

    puts "\nGame over! The secret code was: #{@secret_code.join}"
  end

  private

  def get_guess
    loop do
      print "Enter your 4-color guess (e.g., rgby): "
      input = gets.chomp.downcase.chars

      if input.length == 4 && input.all? { |c| COLORS.include?(c) }
        return input
      else
        puts "Invalid guess. Enter exactly 4 colors from: #{COLORS.join(', ')}"
      end
    end
  end

  def evaluate_guess(player_guess)
    red_pegs = 0
    white_pegs = 0

    temp_secret = @secret_code.dup
    temp_guess = player_guess.dup

    # First pass: check for exact matches (red pegs)
    temp_guess.each_with_index do |color, index|
      if color == temp_secret[index]
        red_pegs += 1
        temp_guess[index] = nil
        temp_secret[index] = nil
      end
    end

    # Second pass: check for color matches in wrong position (white pegs)
    temp_guess.each do |color|
      next if color.nil?

      if temp_secret.include?(color)
        white_pegs += 1
        temp_secret.delete_at(temp_secret.index(color))
      end
    end

    [red_pegs, white_pegs]
  end
end

Game.new.play

