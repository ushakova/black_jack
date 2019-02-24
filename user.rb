class User < Player
  def initialize(name)
    @name = name
    @cards_were_opened = false
    @hand = Hand.new
    @balance = 100
  end
end
