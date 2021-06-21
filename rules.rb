# frozen_string_literal: true

# module with rules for the game
module Rules
  def rules
    <<~HEREDOC

      Mastermind is a 1-player game against the computer.
      You can choose to be either the codemaker or the codebreaker.

      The codemaker creates a secret code that the codebreaker has to crack.
      A "code" is a list of 4 pegs that can include any of these six, repeats allowed:

      red #{peg(:red)}, orange #{peg(:orange)}, yellow #{peg(:yellow)}, green #{peg(:green)}, blue #{peg(:blue)}, purple #{peg(:purple)}

      Example: #{str_code(%w[red yellow blue yellow])}
      Example: #{str_code(%w[green purple orange green])}

      The codebreaker has 12 turns to guess the codemaker's code.
      After each turn, the codebreaker is given feedback on its guess in a sequence of black and white pegs:

      #{str_code(%w[black white])}

      Each black peg means one of the colors in your guess is correct and in the right location.
      Each white peg means one of the colors in your guess is correct, but in the wrong location.

      Example:
      - Secret code: #{str_code(%w[blue orange orange yellow])}
      - Guess: #{str_code(%w[orange blue orange green])}
      - Feedback: #{str_code(%w[black white white])}

      You can input a code by typing out each color or by typing out the first letter of each color.
      "red orange blue green" is the same as "r o b g"

    HEREDOC
  end
end
