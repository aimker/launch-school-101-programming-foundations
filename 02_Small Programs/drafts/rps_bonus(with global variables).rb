VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
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

def winner(human, computer) # Method that increments the winner's score by 1
  if win?(human[:choice], computer[:choice]) # If human wins, his/her score is incremented by 1
    human[:score] += 1
  elsif win?(computer[:choice], human[:choice]) # If computer wins, its score is incremented by 1
    computer[:score] += 1
  end
end

def tournament_winner(winning_score, player) # The method that determines the winner of the mini-tournament.
  if player[:score] == winning_score
    true
  end
end

def display_results(player, computer)
  if win?(player[:choice], computer[:choice])
    prompt("You won!")
  elsif win?(computer[:choice], player[:choice])
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def reset_scores # Scores are reset after the mini-tournament is over.
  $human[:score] = 0
  $computer[:score] = 0
end

$human = {choice: '', score: 0}
$computer = {choice: '', score: 0}

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    $human[:choice] = gets.chomp

    if VALID_CHOICES.include?($human[:choice].downcase) || ABBR_VALID_CHOICES.include?($human[:choice].downcase) # This condition checks if the human choice is included in one of the two arrays
      if $human[:choice].length <= 2 # This condition checks if the player chose the full or the abbreviated version of the word.
        $human[:choice] = VALID_CHOICES.at(ABBR_VALID_CHOICES.index($human[:choice])) # If the player chose the avvreviated version, the array index is used to retrieve the full version.
        break
      else
        break
      end
    else
      prompt("That's not a valid choice.")
    end
  end

  $computer[:choice] = VALID_CHOICES.sample()

  prompt("You chose: #{$human[:choice]}; Computer chose: #{$computer[:choice]}.") #This section contains all the output after both choices have been made.
  display_results($human, $computer)
  winner($human, $computer)
  puts $human[:score]
  puts $computer[:score]
  30.times {print '-'}
  print "\n"


  if tournament_winner(5, $human) # This section contains the code after the mini-tournament is over.
    prompt('Contgratulations! You won the tournament!')
    reset_scores
    prompt("Do you want to play again?")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  elsif tournament_winner(5, $computer)
    prompt('Computer won the tournament!')
    reset_scores
    prompt("Do you want to play again?")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

end

prompt("Thanks for playing. Good bye!")
