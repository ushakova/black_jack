class User < Player
  attr_reader :name, :cards_were_opened
  def initialize(name)
    @name = name
    @cards_were_opened = false
    @cards = []
    @balance = 100
  end

  def open_cards
    self.cards_were_opened = true
    show_cards
  end

  def new_round
    self.cards_were_opened = false
    super
  end

  private

  attr_writer :cards_were_opened
end
