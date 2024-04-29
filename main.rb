require_relative 'deck'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'

require_relative 'helpers/menu'
require_relative 'helpers/helpers'

class BlackJack
  include Menu
  include Helpers

  attr_reader :deck

  def initialize
    @bank = 0
    @deck = []

    puts 'Enter your name:'
    name = take_answer
    @user = User.new(name)
    @dealer = Dealer.new

    show_menu(MAIN_MENU)
  end

  def new_game
    delimiter

    if @user.money.zero? || @dealer.money.zero?
      puts 'One of the players ran out of money. Return to us with money.'
      exit_program
    end

    puts 'New game:'

    @user.clear_hand
    @dealer.clear_hand

    @deck = Deck.new

    @bank += 10
    @user.money -= 10
    @dealer.money -= 10

    2.times do
      @user.get_card(@deck.take_card)
      @dealer.get_card(@deck.take_card)
    end

    show_money

    show_cards
    show_menu(USER_MENU)
  end

  def show_cards(hide_dealer_cards = true)
    puts "Dealer cards: #{@dealer.cards(hide_dealer_cards)}, points: #{@dealer.points(hide_dealer_cards)}"
    puts "Your cards: #{@user.cards}, points: #{@user.points}"
  end

  def user_move
    @user.get_card(@deck.take_card)
    dealer_move
  end

  def dealer_move
    @dealer.get_card(@deck.take_card) if @dealer.points < 17

    end_game
  end

  def end_game
    delimiter
    puts 'Scoring!'
    show_cards(false)

    if (@user.points > @dealer.points && @user.points <= 21) || (@user.points <= 21 && @dealer.points > 21)
      accrual_of_money(@user)
      puts 'User win!'
    elsif  (@dealer.points > @user.points && @dealer.points <= 21) || (@dealer.points <= 21 && @user.points > 21)
      puts 'Dealer win!'
      accrual_of_money(@dealer)
    else
      puts 'Draw!'
      accrual_of_money
    end

    show_menu(MAIN_MENU)
  end

  def accrual_of_money(player = nil)
    @bank -= 20
    if player
      player.money += 20
    else
      @user.money += 10
      @dealer.money += 10
    end
  end

  def show_money
    puts "Your money: #{@user.money}"
  end

  def show_my_money
    delimiter
    show_money
    show_menu(MAIN_MENU)
  end
end
