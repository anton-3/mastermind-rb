# frozen_string_literal: true

require_relative 'code'
require_relative 'rules'

# game logic
class Game
  include Code
  include Rules

  def initialize(max_turns = 12)
    @max_turns = max_turns
  end

  def play
    put_rules
    inp = 'y'
    while inp == 'y'
      set_roles
      @code = @codemaker.make_code
      game_loop
      print 'Press y to play again: '
      inp = gets.chomp.downcase
    end
  end

  private

  def game_loop
    @max_turns.times do |turn_count|
      puts "\nTurn #{turn_count + 1}"
      guess = @codebreaker.make_guess
      @codebreaker.send_feedback(create_feedback(guess))
      if @code == guess
        end_game(@codebreaker)
        break
      elsif turn_count + 1 == max_turns then end_game(@codemaker)
      end
    end
  end

  def end_game(winner)
    puts "\nThe #{winner.type}/#{winner.class == HumanPlayer ? 'human' : 'computer'} wins!"
    puts 'literally <1% chance of this happening lmao' if winner == @codebreaker && winner.class == ComputerPlayer
    reveal_code if winner == @codemaker && @codebreaker.class == HumanPlayer
  end

  def put_rules
    puts rules
  end

  def set_roles
    puts 'Do you want to be the codemaker or the codebreaker?'
    human_role = fetch_human_role
    if %w[cm codemaker].include?(human_role)
      @codemaker = HumanPlayer.new(:codemaker)
      @codebreaker = ComputerPlayer.new(:codebreaker)
    else
      @codemaker = ComputerPlayer.new(:codemaker)
      @codebreaker = HumanPlayer.new(:codebreaker)
    end
  end

  def fetch_human_role
    human_role = gets.chomp.downcase
    loop do
      break if %w[cm cb codemaker codebreaker].include?(human_role)

      puts 'Invalid input!'
      human_role = gets.chomp.downcase
    end
    human_role
  end

  def create_feedback(guess)
    feedback = []
    temp_guess = guess.clone
    temp_code = @code.clone
    guess.each_with_index do |color, index|
      if @code[index] == color
        feedback << 'black'
        temp_guess[index] = temp_code[index] = nil
      end
    end
    temp_guess.compact!
    temp_code.compact!
    temp_guess.each_with_index do |color, index|
      if temp_code.include?(color)
        feedback << 'white'
        temp_guess[index] = temp_code[temp_code.find_index(color)] = nil
      end
    end
    feedback
  end

  def reveal_code
    puts "The code was: #{str_code(@code)}"
  end
end
