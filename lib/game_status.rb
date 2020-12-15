# Helper Method

require "pry"

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = [
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
]

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

def won?(board)
WIN_COMBINATIONS.find do |win_combo|
  win_index_1 = win_combo[0]
  win_index_2 = win_combo[1]
  win_index_3 = win_combo[2]

  board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && position_taken?(board, win_index_1)

  end
end

def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif !won?(board) && !full?(board)
     return false
   else won?(board)
     return false
   end
end

def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
end

def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end
