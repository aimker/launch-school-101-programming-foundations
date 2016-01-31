SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WINNING_VALUE = 21 # Lines 3 & 4 are constants for the needs of question 5
DEALER_STAYS = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > WINNING_VALUE
  end

  sum
end

def busted?(cards)
  total(cards) > WINNING_VALUE
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WINNING_VALUE
    :player_busted
  elsif dealer_total > WINNING_VALUE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    puts "=============="
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    puts "=============="
    prompt "Dealer busted! You win!"
  when :player
    puts "=============="
    prompt "You win!"
  when :dealer
    puts "=============="
    prompt "Dealer wins!"
  when :tie
    puts "=============="
    prompt "It's a tie!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def end_of_round(player_cards, dealer_cards) # End of round method for question 3.
  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
  elsif busted?(dealer_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
  else
    puts "=============="
    prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
    prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  end
end

loop do
  prompt "Welcome to Twenty-One!"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}" # <- Line 117
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  player_total = total(player_cards) # Change as per question 1
  if busted?(player_cards)
    end_of_round(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_STAYS

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  dealer_total = total(dealer_cards) # Change as per question 1
  if busted?(dealer_cards)
    end_of_round(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  end_of_round(player_cards, dealer_cards)
  display_result(dealer_cards, player_cards)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"

## QUESTION 1
# First, what we need to watch out before we use a local variable vs the computation is
# whether we actually save a computation.
# For example, the change mentioned in the question happens after the player's total has been determined,
# so it's not going to change. It is wise not to make a computation again.
# But in line 96, for example, if we declared a local variable, we wouldn't save the computation,
# because the total will be recalculated some time again.

## QUESTION 2
# We call play_again? 3 times, because in every case we must avert the loop from
# being unnecessarily executed, ruining our user experience.
# The difference between the first two calls and the last one, is syntactic.
# The last call is in the last line of the loop, so to have it execute "next"
# would be obsolete, because this is what will be done anyway.
# So for brevity, we only use play_again? to see if we will break the loop or not.
