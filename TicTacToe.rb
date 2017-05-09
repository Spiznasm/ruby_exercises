#Tic Tac Toe Game

class Board
  attr_accessor :game_status, :current_board, :current_move, :current_player, :empty_board
  @@empty_board = [["_","_","_"],["_","_","_"],["_","_","_"]]
  @@diagonals = [[0,0],[2,0],[0,2],[2,2],[1,1]]
  @@diagonal_down = [[0,0],[1,1],[2,2]]
  @@diagonal_up = [[2,0],[1,1],[0,2]]

  def initialize
    @current_board = @@empty_board
    @current_move = []
    @current_player = "X"
    @game_status = "active"
  end

  def place_symbol
    @current_board[@current_move[0]][@current_move[1]] = @current_player
  end

  def display_board
    @current_board.each { |row| puts row.join(" ") }
  end

  def reset
    @game_status = "active"
    @current_board = [["_","_","_"],["_","_","_"],["_","_","_"]]
  end

  def get_move
    puts "Which row?"
    temp_row = gets.to_i
    puts "Which column?"
    temp_col = gets.to_i
    @current_move[0] = temp_row - 1
    @current_move[1] = temp_col - 1

  end

  def verify
    if @current_board[@current_move[0]][@current_move[1]] == "_"
      @current_move.each do |choice|
        if choice.between?(0,2)
          next
        else
          puts "Invalid move, choose rows and columns between 1 and 3"
          self.get_move
          self.verify
        end
      end
    else
      puts "That move has already been used please choose again"
      self.get_move
      self.verify
    end
  end

  def switch_player
    if @current_player == "X"
      @current_player = "O"
    else
      @current_player = "X"
    end
  end

  def start_game
    self.reset

    while @game_status == "active"
      self.display_board
      self.get_move
      self.verify
      self.place_symbol
      if self.check_win == true
        @game_status = "inactive"
        self.display_board
        puts "#{@current_player} wins"
      end
      self.switch_player
    end


  end

  def check_win
    if @current_move == []
      return false
    else
      move_row = @current_move[0]
      move_col = @current_move[1]
      if (@current_board[move_row][0] == @current_board[move_row][1] && @current_board[move_row][1] == @current_board[move_row][2]) ||
        (@current_board[0][move_col] == @current_board[1][move_col] && @current_board[1][move_col] == @current_board[2][move_col])
        return true
      elsif @@diagonal_up.include? @current_move
        @current_board[2][0]==@current_board[1][1]&&@current_board[1][1]==@current_board[0][2] ? true : false

      elsif @@diagonal_down.include? @current_move
        @current_board[0][0]==@current_board[1][1]&&@current_board[1][1]==@current_board[2][2] ? true : false

      else
        return false
      end
    end
  end




end
