# frozen_string_literal: true

require_relative 'code'

# logic for any players
class Player
  include Code

  attr_reader :type

  COLORS = %w[red orange yellow green blue purple].freeze
  LETTER_COLORS = %w[r o y g b p].freeze
  COLORS_HASH = {
    'r' => 'red',
    'o' => 'orange',
    'y' => 'yellow',
    'g' => 'green',
    'b' => 'blue',
    'p' => 'purple'
  }.freeze

  def initialize(type)
    @type = type
  end
end
