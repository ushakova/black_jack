class Card
  attr_accessor :suit, :value

  SUITS = %w[♠ ♥ ♣ ♦].freeze
  PICTURES = %i[jack queen king ace].freeze

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def ace?
    value == :ace
  end

  def show_card
    print "#{value}#{suit} "
  end
end
