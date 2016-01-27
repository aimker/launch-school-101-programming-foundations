#require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WHOS_FIRST = 'choose'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd, player, computer)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "Player: #{player[-1]}"
  puts "Computer: #{computer[-1]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each{ |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  #binding.pry
  brd.keys.select{ |num| brd[num] == INITIAL_MARKER }
end

def joinor (squares, delimiter = ', ', last_word = 'or' ) # Joinor method for Question 1
  squares[-1] = squares.last.to_s.prepend(' ').prepend(last_word) unless squares.length == 1
  squares.join(delimiter)
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return "Player"
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return "Computer"
    end
  end
  nil
end

def score_keeper(brd, player, computer) # For question 2, adds a point to the player that wins a game.
  if detect_winner(brd) == "Player"
    player.push(player.length)
  elsif detect_winner(brd) == "Computer"
    computer.push(computer.length)
  end
  display_board(brd, player, computer)
end

def reset_scores(player, computer) # For question 2, resets the scores back to 0.
  player = [0]
  computer = [0]
  return player, computer
end

def board_full?(brd)
  empty_squares(brd) == []
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_defend_position(brd, square, empty) # Defensive block
  WINNING_LINES.each do |line|
    line.each { |place| empty = place if brd[place] == INITIAL_MARKER }
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 && empty != 0
      square = empty
      return square
      break
    end
  end
  0
end

def computer_attack_position(brd, square, empty) # Attacking block
  WINNING_LINES.each do |line|
    line.each { |place| empty = place if brd[place] == INITIAL_MARKER}
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && empty != 0
      square = empty
      return square
      break
    end
  end
  0
end

def is_central_available?(brd) # Checks if central piece is free
  empty_squares(brd).include?(5)
end

def computer_places_piece!(brd) # Added AI Defense for Question 3
  square = 0
  empty_square = 0

  square = computer_attack_position(brd, square, empty_square) if square == 0
  square = computer_defend_position(brd, square, empty_square) if square == 0
  square = 5 if square == 0 && is_central_available?(brd)
  square = empty_squares(brd).sample if square == 0
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    return player_places_piece!(brd)
  elsif current_player == 'computer'
    return computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    return 'computer'
  else
    return 'player'
  end
end

player = [0]
computer = [0]

loop do
  current_player = WHOS_FIRST
  if WHOS_FIRST == 'choose' # Condition to choose who plays first
    loop do
      prompt "Who would you like to play first?(Player or Computer)"
      answer = gets.chomp.downcase
      if answer == 'player'
        current_player = 'player'
        prompt "Player plays first."
        break
      elsif answer == 'computer'
        current_player = 'computer'
        prompt "Computer plays first."
        break
      else
        prompt "Please select a valid choice."
      end
    end
  end

  board = initialize_board

  # loop do
  #   display_board(board, player, computer)
  #   player_places_piece!(board)
  #   break if someone_won?(board) || board_full?(board)
  #
  #   computer_places_piece!(board)
  #   break if someone_won?(board) || board_full?(board)
  # end

  loop do # improved game loop.
    display_board(board, player, computer)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    score_keeper(board, player, computer)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  if player[-1] == 5 # For question 2, if a player has 5 points, he's declared winner of the tournament, and scores are reset.
    puts "You won the tournament!"
    player, computer = reset_scores(player, computer)
  elsif computer[-1] == 5
    puts "Computer won the tournament..."
    reset_scores(player, computer)

  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
