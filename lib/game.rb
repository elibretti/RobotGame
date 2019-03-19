require_relative 'board'
require_relative 'robot'
require 'byebug'
class Game
    attr_reader :board, :robot
    def initialize
        @board = Board.new
        @robot = Robot.new
        @valid_directions = ["NORTH", "EAST", "SOUTH", "WEST"]
    end
    
    def run(commands = nil) 
        if(commands)
            commands.each do |command|
                process_command(command)
            end
        else 
            @board.display
            @board.print_instructions
            loop do 
                command = STDIN.gets.chomp
                break if command == "EXIT"
                process_command(command)
            end
        end
    end


    def place(row, col, direction)
        if(valid_pos(row, col) && valid_dir(direction))
            @board.clear_move(@robot.position) if @robot.is_placed?
            @robot.place(row,col,direction)
            @board.add_move([row,col])
            @board.change_direction(direction)
            @board.display
        else 
            return false
        end
    end

    def move
        pos = @robot.position
        case @robot.direction
            when "NORTH"
                new_pos = [pos[0], pos[1] + 1]
            when "EAST"
                new_pos = [pos[0] + 1, pos[1]]
            when "SOUTH"
                new_pos = [pos[0], pos[1] - 1]
            when "WEST"
                new_pos = [pos[0] - 1, pos[1]]
        end
        
        if(valid_pos(new_pos[0], new_pos[1]))
            @robot.set_position(new_pos)
            @board.clear_move(pos)
            @board.add_move(new_pos)
            @board.display
        end
    end

    def valid_pos(row, col)
        if(row.between?(0,4) && col.between?(0,4))
            return true
        else
            puts "Position is off the table"
            return false
        end
    end
    
    def valid_dir(direction)
        if @valid_directions.include?(direction)
            return true
        else
            puts "Invalid Direction"
            return false
        end
    end

    def rotate(direction)
        dir_index = @valid_directions.index(@robot.direction)
        if(direction == "LEFT")
            @robot.set_direction(@valid_directions[(dir_index - 1) % 4])
            @board.change_direction(@robot.direction)
            @board.display
        elsif(direction == "RIGHT")
            @robot.set_direction(@valid_directions[(dir_index + 1) % 4])
            @board.change_direction(@robot.direction)
            @board.display
        end
    end

    def report
        system('clear')
        puts "#{@robot.position[0]},#{@robot.position[1]},#{@robot.direction}"
    end

    def check_placed
        unless(@robot.is_placed?)
            puts "Please place your robot before entering other commands"
            return false
        else
            return true 
        end
    end

    def process_command(command)
        place_input = command.match /^PLACE (.*),(.*),(.*)/
        if(place_input)
            row = place_input[1].to_i
            col = place_input[2].to_i
            direction = place_input[3]
            command = "PLACE"
        end

        case command
            when "PLACE"
                place(row,col,direction)
            when "MOVE"
                move if check_placed
            when "LEFT"
                rotate("LEFT") if check_placed
            when "RIGHT"
                rotate("RIGHT") if check_placed
            when "REPORT"
                report if check_placed
            else
                puts "Not a valid command"
        end
        
    end
end
