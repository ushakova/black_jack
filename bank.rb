class Bank
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def give_money(player, amount)
    player.balance += amount
    self.balance -= amount
  end
end
