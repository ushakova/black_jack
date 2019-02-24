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
      "#{winner.name} wins!"
    end
  end

  private

  attr_reader :user, :dealer, :bank

  def give_money(player, amount)
    player.balance += amount
    bank.balance -= amount
  end

  def total_score(player)
    player.hand.total_score
  end

  def lose?(player)
    player.hand.lose?
  end

  def draw?
    (lose?(user) && lose?(dealer)) || (total_score(user) == total_score(dealer))
  end

  def draw
    amount = bank.balance / 2
    [user, dealer].each { |player| give_money(player, amount) }
    'Draw!'
  end

  def winner
    @winner ||= begin
     lose?(dealer) || total_score(user) > total_score(dealer) ? user : dealer
   end
  end
end
