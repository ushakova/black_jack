class Card
  attr_accessor :suit, :value

  SUITS = %w[♠ ♥ ♣ ♦].freeze
  PICTURES = %i[J Q K A].freeze

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def ace?
    value == :A
  end

  def show_card
    print "#{value}#{suit} "
  end
end
