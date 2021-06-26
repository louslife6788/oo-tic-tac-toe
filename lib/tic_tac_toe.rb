require "pry"

class TicTacToe
    WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 4, 6],
  [2, 5, 8],
  [3, 4, 5],
  [6, 7, 8]
]

    attr_accessor :board


    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    
    
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
      
          
    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, current_player)
        @board[index] = current_player
    end

    def position_taken?(index)
        @board[index] != "" && @board[index] != " "
    end

    def valid_move?(index)
        if index.between?(0,8) &&  !position_taken?(index)
            return true
        else 
        puts "invalid move try again"
        end
    end

    def  turn_count
        counter = 0 
        @board.each do |i| 
            if i == "X" || i == "O"
                 counter += 1 
            
            end
        end
        counter
    end

    def current_player
        if turn_count % 2 == 0 
            "X"
        else
            "O"
        end
    end 

    def turn
        puts " Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end
     
    def won? 
        WIN_COMBINATIONS.find do |combo|
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0])
        end
    end

     def full?
        @board.all? do |space|
             space == "X" || space == "O"
        end
    end

    def draw?
         full? && !won?
        
    end


    def over? 
        draw? || won?
    end


    def winner
        if won?
            won?.find do |symbol|
                @board[symbol] == "X" || @board[symbol] == "O"
                return board[symbol]
            end
        end
    end

    def play
        turn until over?
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end

end