suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
value = [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 10, 10, 10]
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
  puts "Your score is #{hand_score(player)}"
end

def show_hands_dealer_turn(player, dealer)
  system 'clear'
  puts "Player's hand: #{player}"
  puts "Dealer's hand: #{dealer}"
  puts "Now it's the dealer's turn"
  puts "Your score is #{hand_score(player)}"
  puts "Dealer's score is #{hand_score(dealer)}"
end

def draw_card!(deck, hand)
  hand << deck.pop
end

def hand_score(hand,
               ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'],
               value = [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 10, 10, 10])
  score = 0
  hand.each do |card|
    score += value[ranks.index(card[1])]
  end
  score += 10 if (score + 10) <= 21 && hand.flatten.include?('A') # Given that the rule allows only one Ace to be equal to 11.
  score
end

def bust?(hand)
  hand_score(hand) > 21
end

def blackjack?(hand)
  hand_score(hand) == 21 && hand.length == 2
end

def who_won?(player_hand, dealer_hand, player_total, dealer_total)
  if blackjack?(player_hand)
    puts "Blackjack! You won!"
  elsif blackjack?(dealer_hand)
    puts "Blackjack! Dealer won..."
  elsif bust?(player_hand)
    puts "Bust! Dealer won.."
  elsif bust?(dealer_hand)
    puts "Dealer bust! You won!!"
  elsif player_total > dealer_total
    puts "You won!"
  elsif player_total < dealer_total
    puts "Dealer won..."
  else
    puts "It's a tie."
  end
end

def player_turn(deck, player_hand, dealer_hand)
  score = hand_score(player_hand)
  loop do
    puts "Insert 'hit' to hit or 'stay' to stay:" # Player turn
    answer = gets.chomp

    if answer.downcase == 'hit'
      draw_card!(deck, player_hand)
      show_hands_player_turn(player_hand, dealer_hand)
      score = hand_score(player_hand)
      break if bust?(player_hand) || score == 21
    elsif answer.downcase == 'stay'
      puts "You chose to stay."
      break
    else
      puts "Please insert a valid answer"
      next
    end
  end
  score
end

def dealer_turn(deck, dealer, player)
  score = 0
  loop do
    score = hand_score(dealer)
    break if score >= 17
    draw_card!(deck, dealer) if score < 17
    sleep 2
    show_hands_dealer_turn(player, dealer)
  end
  score
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

  # The drawing begins, unless there was a blackjack in the starting hands.
  if !(blackjack?(player_hand) || blackjack?(dealer_hand))
    player_total = player_turn(deck, player_hand, dealer_hand) # Player's turn

    sleep 2
    if !(bust?(player_hand)) # Dealer's turn
      show_hands_dealer_turn(player_hand, dealer_hand)
      dealer_total = dealer_turn(deck, dealer_hand, player_hand)
    end
  end

  who_won?(player_hand, dealer_hand, player_total, dealer_total) # Prints who wins.

  puts "Play again? (y or n)"
  answer = gets.chomp
  player_hand, dealer_hand, player_total, dealer_total = reset(player_hand, dealer_hand, player_total, dealer_total) if answer.downcase.start_with?('y')
  break unless answer.downcase.start_with?('y')
end
