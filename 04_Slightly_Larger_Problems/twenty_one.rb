suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
value = [[1, 11], 2, 3, 4 , 5, 6, 7, 8, 9, 10, 10, 10, 10]
drawn_cards = []

player_hand = []
player_total = 0
dealer_hand = []
dealer_total = 0

def initialize_shuffled_deck(suits, ranks)
  deck = suits.product(ranks).shuffle
  #puts deck.inspect
  deck
end

def starting_hands!(player, dealer, deck)
  2.times do
    player.push(deck.pop)
    dealer.push(deck.pop)
  end
end

def show_hands_player_turn(player, dealer)
  system 'clear'
  puts "Player's hand: #{player}"
  puts "Dealer's hand: #{dealer.select{|card| card != dealer.first}} + 1 hidden card..."
end

def show_hands_dealer_turn(player, dealer)
  system 'clear'
  puts "Player's hand: #{player}"
  puts "Dealer's hand: #{dealer}"
end

def draw_card(deck, hand)
  hand << deck.pop
end

def player_turn(deck, hand)

end

def dealer_turn(deck, hand)

end

def hand_score(hand,
               ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'],
               value = [[1, 11], 2, 3, 4 , 5, 6, 7, 8, 9, 10, 10, 10, 10])
  score = 0
  hand.each do |card|
    score += value[ranks.index(card[1])] unless card[1] == 'A'
    score += 11 if card[1] == 'A'
  end
  score
end

def bust?(hand)
  hand_score(hand) > 21
end

def blackjack?(hand)
  hand_score(hand) == 21 && hand.length == 2
end

def who_won?(player_hand, dealer_hand, player_total, dealer_total)
  if bust?(player_hand)
    puts "You busted! Dealer won.."
  elsif bust?(dealer_hand) || player_score > dealer_score
    puts "You won!!"
  else
    puts "Dealer won.."
  end
end

def reset(player_hand, dealer_hand, player_total, dealer_total)
  player_hand = []
  player_total = 0
  dealer_hand = []
  dealer_total = 0
  return player_hand, dealer_hand, player_total, dealer_total
end

loop do
  deck = initialize_shuffled_deck(suits,ranks) # Initializes the deck
  starting_hands!(player_hand, dealer_hand, deck) # Gives the initial hands
  player_total = hand_score(player_hand) # Calculates the initial player score
  dealer_total = hand_score(dealer_hand) # Calculates the initial dealer score
  show_hands_player_turn(player_hand, dealer_hand) # The visual aspect of the game, that shows the hands.

  loop do # Game takes place here
    puts "Insert 'hit' to hit or 'stay' to stay:" # Player turn
    answer = gets.chomp

    if answer.downcase == 'hit'
      draw_card(deck, player_hand)
      show_hands_player_turn(player_hand, dealer_hand)
      player_total = hand_score(player_hand)
    elsif answer.downcase == 'stay'
      player_total = hand_score(player_hand)
    else
      puts "Please insert a valid answer"
      next
    end

    if bust?(player_hand)
      puts "You busted! Dealer won.."
    # elsif bust?(dealer_hand) || player_total > dealer_total
    #   puts "You won!!"
    # else
    #   puts "Dealer won.."
    # end
    player_hand, dealer_hand, player_total, dealer_total = reset(player_hand, dealer_hand, player_total, dealer_total)
    end
  end

#puts "Card is #{player_hit}. Your total is #{player_total}."
end

# Bugs: 1. Ace value is set only at the beginning


# if player_hand.last[1] == 'A' && (player_total + 11) <= 21
#   player_total += value[ranks.index('A')][1]
#   #player_score = hand_score(player_hand)
#   puts "You hit #{player_hand.last[1]}; Your total is #{player_total}."
# elsif player_hand.last[1] == 'A' && (player_total + 11) > 21
#   player_total += value[ranks.index('A')][0]
#   #player_score = hand_score(player_hand)
#   puts "You hit #{player_hand.last[1]}; Your total is #{player_total}."
# else
#   #player_total += value[ranks.index(player_hand.last[1])]
#   player_score = hand_score(player_hand, ranks, value)
#   puts "You hit #{player_hand.last[1]}; Your total is #{player_score}."
# end
