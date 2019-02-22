class User < Player
  attr_reader :name, :hand
  def initialize(name)
    @name = name
    @cards_were_opened = false
    @hand = Hand.new
    @balance = 100
  end
end
