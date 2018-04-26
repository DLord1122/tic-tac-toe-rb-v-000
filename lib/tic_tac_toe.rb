
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" "," "," "," "," "," "," "," "," "]

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def display_board(board)

    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    board = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end
  def valid_move?(board, index)
     if index.between?(0,8) && !position_taken?(board, index)
       true
     else
       false
      end
   end
   def position_taken?(board, index)
    taken = nil
    if (board[index] ==  " " || board[index] == nil)
      taken = false
    else
      taken = true
    end
      taken
  end
  def move(index, token = "X")
    @board[index.to_i] = token
  end
  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index )
      display_board(board)
    else
      turn(board)
    end
  end
  def turn_count(board)
  number_of_turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      number_of_turns += 1
    end
  end
  return number_of_turns
end
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end
   def position_taken?(board, location)
    board[location] != " "
   end


  def won?(board)
    WIN_COMBINATIONS.detect do |win_combo|
      if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
        return win_combo
      elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O"
        return win_combo
      end
        false
    end
  end

  def full?(board)
  board.all?{|occupied| occupied != " "}
end

def draw?(board)
  !(won?(board)) && (full?(board))
end

def over?(board)
  (won?(board)) || (full?(board)) || (draw?(board))
end

def winner(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
      return "X"
    elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end
def turn_count(board)
  board.count {|token| token == "X" || token == "O"}
    turns = 0
    board.each do |token|
      if token == "X" || token == "O"
        turns += 1
      end
end
turns
end
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index )
    display_board(board)
  else
    turn(board)
  end
end
 def position_taken?(board, location)
  board[location] != " "
 end
