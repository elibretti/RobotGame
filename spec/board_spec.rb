require 'rspec'
require 'board'

describe Board do 
    let(:board){Board.new}
    let(:empty_arr){Array.new(5) {Array.new(5, " ")}}

    describe ".empty_grid" do
        it "returns a 5x5 array of blank spaces" do 
            expect(Board.empty_grid).to eq(empty_arr)
        end
    end

    describe "#initialize" do 
        it "sets the board using .empty_grid" do
            expect(Board).to receive(:empty_grid)
            Board.new
        end      
        it "sets current_pos instance variable to nil" do 
            expect(board.current_pos).to be_nil
        end
        it "sets mark instance variable to 'X'" do 
            expect(board.mark).to eq("X")
        end

    end

    describe "#add_move" do 
        before(:each) do 
            board.add_move([0,0])
        end
        it "sets the position on the board to be a mark" do 
            expect(board[[0,0]]).to eq(board.mark)
        end
        it "sets current_pos to the specified position" do 
            expect(board.current_pos).to eq([0,0])
        end
    end

    describe "#clear_move" do 
        before(:each) do 
            board.add_move([0,0])
            board.clear_move([0,0])
        end
        it "sets a mark in the specified position" do 
            expect(board[[0,0]]).to eq(" ")
        end
        it "sets current_pos to nil" do 
            expect(board.current_pos).to be_nil
        end
    end

    describe "#change_direction" do 
        before(:each) do 
            board.add_move([0,0])
        end
        it "sets mark to '^' when direction = 'NORTH' " do 
            board.change_direction("NORTH")
            expect(board.mark).to eq('^')
        end
        it "sets mark to '>' when direction = 'EAST' " do 
            board.change_direction("EAST")
            expect(board.mark).to eq('>')
        end
        it "sets mark to 'v' when direction = 'SOUTH' " do 
            board.change_direction("SOUTH")
            expect(board.mark).to eq('v')
        end
        it "sets mark to '<' when direction = 'WEST' " do 
            board.change_direction("WEST")
            expect(board.mark).to eq('<')
        end
        it "sets the board at the current position to be the mark" do 
            board.change_direction("NORTH")
            expect(board[[0,0]]).to eq('^')
        end

    end


end