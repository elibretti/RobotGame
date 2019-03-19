class Board
    attr_reader :current_pos, :mark
    def self.empty_grid
        Array.new(5) {Array.new(5, " ")}
    end

    def initialize
        @board = Board.empty_grid
        @mark = "X"
        @current_pos = nil 
    end

    def [](pos)
        col, row = pos
        @board[4-row][col]
    end

    def []=(pos, mark)
        col, row = pos
        @board[4-row][col] = mark
      end
    

    def add_move(pos)
        self[pos] = @mark
        @current_pos = pos
    end

    def clear_move(pos)
        self[pos] = " "
        @current_pos = nil
    end

    def change_direction(direction)
        case direction
            when "NORTH"
                @mark = "^"   
            when "EAST"
                @mark = ">"      
            when "SOUTH"
                @mark = "v"    
            when "WEST"
                @mark = "<"          
        end
        self[@current_pos] = @mark
    end

    def print_instructions
        puts ""
        puts ""
        puts "Instructions:"
        puts "-Move the toy robot around the 5x5 board"
        puts "-To place the robot enter PLACE row,column,direction"
        puts "-Move robot by typing MOVE"
        puts "-Change direction by typing LEFT or RIGHT"
        puts "-Type REPORT for your robots coordinates"
        puts "-Type `EXIT` to exit"
    end

    def display
        system("clear")

        puts "       NORTH"
        puts "   WEST     EAST"
        puts "       SOUTH"
        puts ""
        puts ""
        puts ""
        puts "       0   1   2   3   4 "
        puts ""
        @board.each_with_index do |row, idx| 
            puts "   #{idx}   #{row.join(" | ")}"
            unless(idx == 4)
                puts "       -----------------"
            end
        end
    end

end
