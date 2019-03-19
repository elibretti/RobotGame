class Robot 
    attr_reader :position, :direction
    def initialize()
        @position
        @direction
        @placed = false
    end

    def place(row,col,direction)
        set_position([row,col])
        set_direction(direction)
        @placed = true
    end

    def is_placed?
        @placed
    end

    def set_position(position)
        @position = position
    end

    def set_direction(direction)
        @direction = direction
    end

    

end
