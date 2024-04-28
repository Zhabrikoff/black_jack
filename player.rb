class Player
  attr_reader :name, :hand
  attr_accessor :money

  def initialize(name)
    @name = name
    @money = 100
    @hand = []
  end

  def get_card(card)
    @hand << card
  end

  def cards(hide_dealer_cards = false)
    if hide_dealer_cards
      ('*, ' * @hand.length).strip 
    else
      hand.reduce([]) { |cards, card| cards << card[:value] }.join(', ')
    end
  end

  def points(hide_dealer_cards = false)
    return '*' if hide_dealer_cards

    ace_count = 0
    hand.reduce(0) do |sum, card|
      ace_count += 1 if card.keys.include?(:flexible_points)
      sum -= 10 if ace_count > 1
      sum + card[:points]
    end
  end

  def clear_hand
    @hand = []
  end
end
