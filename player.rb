class NotEnoughMoneyError < RuntimeError; end
class Player
  attr_accessor :balance, :cards, :hand, :name
  BET_AMOUNT = 10

  def initialize(name)
    @name = name
    @hand = Hand.new
    @balance = 100
  end

  def make_bet(bank)
    raise NotEnoughMoneyError if balance < BET_AMOUNT

    self.balance -= BET_AMOUNT
    bank.balance += BET_AMOUNT
  end

  def new_round
    self.hand = Hand.new
  end
end
