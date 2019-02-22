class NotEnoughMoneyError < RuntimeError; end
class Player
  attr_accessor :balance, :cards, :hand

  def make_bet(bank)
    raise NotEnoughMoneyError if balance < 10

    self.balance -= 10
    bank.balance += 10
  end

  def new_round
    self.hand = Hand.new
  end
end
