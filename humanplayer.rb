# frozen_string_literal: true

# logic for the human player
class HumanPlayer < Player
  # codemaker
  def make_code
    puts "\nEnter your secret code:"
    code = convert_colors(fetch_valid_code)
    puts "The secret code: #{str_code(code)}"
    code
  end

  # codebreaker
  def make_guess
    puts 'Enter your guess:'
    guess = convert_colors(fetch_valid_code)
    puts "Your guess: #{str_code(guess)}"
    guess
  end

  # codebreaker
  def send_feedback(feedback)
    puts "Feedback: #{str_code(feedback)}"
  end

  private

  def fetch_valid_code
    code = []
    loop do
      code = gets.chomp.downcase.split
      break if check_valid?(code)

      puts 'Invalid input!'
    end
    code
  end

  def check_valid?(code)
    code.length == 4 && code.reduce(true) do |memo, word|
      memo && (COLORS + LETTER_COLORS).include?(word)
    end
  end

  def convert_colors(code)
    code.map do |color|
      color.length == 1 ? COLORS_HASH[color] : color
    end
  end
end
