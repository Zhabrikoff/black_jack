class Deck
  CARDS = [
    { value: '2♥', points: 2 },
    { value: '3♥', points: 3 },
    { value: '4♥', points: 4 },
    { value: '5♥', points: 5 },
    { value: '6♥', points: 6 },
    { value: '7♥', points: 7 },
    { value: '8♥', points: 8 },
    { value: '9♥', points: 9 },
    { value: '10♥', points: 10 },
    { value: 'J♥', points: 10 },
    { value: 'Q♥', points: 10 },
    { value: 'K♥', points: 10 },
    { value: 'A♥', points: 11, flexible_points: true },

    { value: '2♦', points: 2 },
    { value: '3♦', points: 3 },
    { value: '4♦', points: 4 },
    { value: '5♦', points: 5 },
    { value: '6♦', points: 6 },
    { value: '7♦', points: 7 },
    { value: '8♦', points: 8 },
    { value: '9♦', points: 9 },
    { value: '10♦', points: 10 },
    { value: 'J♦', points: 10 },
    { value: 'Q♦', points: 10 },
    { value: 'K♦', points: 10 },
    { value: 'A♦', points: 11, flexible_points: true },

    { value: '2♠', points: 2 },
    { value: '3♠', points: 3 },
    { value: '4♠', points: 4 },
    { value: '5♠', points: 5 },
    { value: '6♠', points: 6 },
    { value: '7♠', points: 7 },
    { value: '8♠', points: 8 },
    { value: '9♠', points: 9 },
    { value: '10♠', points: 10 },
    { value: 'J♠', points: 10 },
    { value: 'Q♠', points: 10 },
    { value: 'K♠', points: 10 },
    { value: 'A♠', points: 11, flexible_points: true },

    { value: '2♣', points: 2 },
    { value: '3♣', points: 3 },
    { value: '4♣', points: 4 },
    { value: '5♣', points: 5 },
    { value: '6♣', points: 6 },
    { value: '7♣', points: 7 },
    { value: '8♣', points: 8 },
    { value: '9♣', points: 9 },
    { value: '10♣', points: 10 },
    { value: 'J♣', points: 10 },
    { value: 'Q♣', points: 10 },
    { value: 'K♣', points: 10 },
    { value: 'A♣', points: 11, flexible_points: true }
  ].freeze

  def initialize
    @deck = CARDS.shuffle
  end

  def take_card
    card =  @deck[rand(0..@deck.length - 1)]
    @deck.delete(card)
  end
end
