require 'rspec'
require 'game'

describe Game do 
    let(:game){Game.new}
    let(:valid_moves){["PLACE 0,0,NORTH", "MOVE"]}
    let(:invalid_moves){["PLACE 0,0,SOUTH", "MOVE"]}

    describe "#initialize" do 
        it "creates a new instance of the board class" do 
            expect(game.board).to be_a(Board)
        end
        it "creates a new instance of the Robot class" do 
            expect(game.robot).to be_a(Robot)
        end
    end

    describe  "#valid_pos" do 
        it "should return true if x and y are both between 0 and 4" do 
            expect(game.valid_pos(0,0)).to be true
        end
        it "should return print 'Position is off the table'  and return false if not" do 
            expect(game.valid_pos(0,6)).to be false
            expect{game.valid_pos(0,6)}.to output("Position is off the table\n").to_stdout
        end
    end

    describe  "#valid_dir" do 
        it "should return true if direction is 'NORTH' 'EAST' 'WEST' or 'SOUTH'" do 
            expect(game.valid_dir("NORTH")).to be true
            expect(game.valid_dir("EAST")).to be true
            expect(game.valid_dir("WEST")).to be true
            expect(game.valid_dir("SOUTH")).to be true
        end
        it "should return false and print 'Invalid Direction' if not " do 
            expect(game.valid_dir("NORTHWEST")).to be false
            expect{game.valid_dir("NORTHWEST")}.to output("Invalid Direction\n").to_stdout

        end
    end

    describe "#place" do
     context "valid row col and direction" do 
            it "should alter the robot and board accordingly" do 
                allow($stdout).to receive(:puts)
                expect(game.robot).to receive(:place).with(0,0,"NORTH")
                expect(game.board).to receive(:add_move).with([0,0])
                expect(game.board).to receive(:change_direction).with("NORTH")
                game.place(0,0,"NORTH")
            end
        end
    end
    context "invalid row col or direction" do 
        it "should return false" do 
            expect(game.place(0,7,"NORTH")).to be false
        end
    end

end