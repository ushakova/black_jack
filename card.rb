class Card
  attr_accessor :suit, :value, :score

  SUITS = %w[♠ ♥ ♣ ♦].freeze
  SCORES = { jack: 10,
             queen: 10,
             king: 10,
             ace: 1 }.freeze

  def initialize(suit, value)
    @suit = suit
    @value = value
    @score = SCORES.key?(value) ? SCORES[value] : value.to_i
  end

  def ace?
    value == :ace
  end

  def show_card
    print "#{value}#{suit} "
  end
end
