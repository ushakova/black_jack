class Hand
  attr_accessor :cards, :cards_were_opened

  SCORES = { J: 10, Q: 10, K: 10, A: 1 }.freeze

  def initialize
    @cards = {}
  end

  def open_cards
    self.cards_were_opened = true
    show_cards
  end

  def show_cards
    cards.each_key(&:show_card)
  end

  def take_card(card)
    cards[card] = card_score(card.value)
  end

  def card_score(card_value)
    SCORES.key?(card_value) ? SCORES[card_value] : card_value.to_i
  end

  def total_score
    sum = 0
    cards.each_value { |v| sum += card_score(v) }
    sum += 10 if cards.keys.find(&:ace?) && (sum <= 11)
    sum
  end

  def lose?
    total_score > 21
  end

  def can_take_more_cards?
    return true unless cards

    cards.size < 3
  end
end
