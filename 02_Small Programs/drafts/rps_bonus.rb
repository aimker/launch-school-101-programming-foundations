VALID_CHOICES = %w(rock paper scissors lizard spock)
ABBR_VALID_CHOICES = ['r', 'p', 'sc', 'l', 'sp'] # array with the abbreviated choices. To choose a word that starts with s, you have to type the first two letters.

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second) # Changed rules, to include lizard and spock
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end


loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice.downcase) || ABBR_VALID_CHOICES.include?(choice.downcase) # This condition checks if the human choice is included in one of the two arrays
      if choice.length <= 2 # This condition checks if the player chose the full or the abbreviated version of the word.
        choice = VALID_CHOICES.at(ABBR_VALID_CHOICES.index(choice)) # If the player chose the avvreviated version, the array index is used to retrieve the full version.
        break
      else
        break
      end
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing. Good bye!")
