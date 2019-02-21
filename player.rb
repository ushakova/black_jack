class NotEnoughMoneyError < RuntimeError; end
class Player
  attr_accessor :balance, :cards

  def score
    sum = cards.map(&:score).sum
    sum += 10 if cards.find(&:ace?) && (sum <= 11)
    sum
  end

  def lose?
    score > 21
  end

  def show_cards
    cards.each(&:show_card)
    puts
  end

  def can_take_more_cards?
    return true unless cards

    cards.size < 3
  end

  def make_bet(bank)
    raise NotEnoughMoneyError if balance < 10

    self.balance -= 10
    bank.balance += 10
  end

  def new_round
    self.cards = []
  end
end
