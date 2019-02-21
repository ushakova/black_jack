class Calculator
  def initialize(user, dealer, bank)
    @user = user
    @dealer = dealer
    @bank = bank
  end

  def calculate
    if draw?
      draw
    else
      give_money(winner, bank.balance)
      "#{winner} wins!"
    end
  end

  private

  attr_reader :user, :dealer, :bank

  def give_money(player, _amount)
    player.balance += bank.balance
    bank.balance = 0
  end

  def draw?
    (user.lose? && dealer.lose?) || (user.score == dealer.score)
  end

  def draw
    amount = bank.balance / 2
    [user, dealer].each { |player| give_money(player, amount) }
    'Draw!'
  end

  def winner
    @winner ||= dealer.lose? || user.score > dealer.score ? user : dealer
  end
end
