class Calculator
  def initialize(user, dealer, bank)
    @user = user
    @dealer = dealer
    @bank = bank
    @scores = { user => user.hand.total_score, dealer => dealer.hand.total_score }
    @losers = { user => user.hand.lose?, dealer => dealer.hand.lose? }
  end

  def calculate
    if draw?
      draw
    else
      bank.give_money(winner, bank.balance)
      "#{winner.name} wins!"
    end
  end

  private

  attr_reader :user, :dealer, :bank, :scores, :losers

  def draw?
    (losers[user] && losers[dealer]) ||
      (scores[user] == scores[dealer])
  end

  def draw
    amount = bank.balance / 2
    [user, dealer].each { |player| bank.give_money(player, amount) }
    'Draw!'
  end

  def winner
    @winner ||= begin
      not_lost = losers.reject { |k, v| v }
      max_score = not_lost.size == 1 ? not_lost.first : scores.max_by { |k, v| v }
      max_score.first
   end
  end
end
