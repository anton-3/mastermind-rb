# frozen_string_literal: true

# logic for codes
module Code
  PEGS = {
    red: "\e[31m\u25CF\e[0m ",
    orange: "\e[33m\u25CF\e[0m ",
    yellow: "\e[33;1m\u25CF\e[0m ",
    green: "\e[32m\u25CF\e[0m ",
    blue: "\e[34m\u25CF\e[0m ",
    purple: "\e[35m\u25CF\e[0m ",
    white: "\u25CF ",
    black: "\u25CB "
  }.freeze

  def peg(color)
    PEGS[color.to_sym]
  end

  def str_code(code)
    output = ''
    code.each do |color|
      output += peg(color)
    end
    output
  end
end
