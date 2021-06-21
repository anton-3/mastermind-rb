# frozen_string_literal: true

# logic for the computer player
class ComputerPlayer < Player
  # codemaker
  def make_code
    fetch_random_code
  end

  # codebreaker
  def make_guess
    sleep 1
    code = fetch_random_code
    puts "Computer's guess: #{str_code(code)}"
    code
  end

  # codebreaker
  def send_feedback(feedback)
    sleep 1
    puts "Computer's feedback: #{str_code(feedback)}"
    sleep 1
  end

  private

  def fetch_random_code
    code = []
    4.times do
      code.push(COLORS.sample)
    end
    code
  end
end
