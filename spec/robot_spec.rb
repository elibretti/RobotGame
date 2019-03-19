require 'rspec'
require 'robot'

describe Robot do 
    let(:robot) {Robot.new}

    describe '#initialize' do 
        it "sets up position and direction instance variables" do 
            expect(robot.position).to be_nil
            expect(robot.direction).to be_nil
        end
    end

    describe  '#set_position' do 
        it "sets position instance variable to specified value" do 
            robot.set_position([1,1])
            expect(robot.position).to eq([1,1])
        end
    end

    describe  '#set_position' do 
        it "sets direction instance variable to specified value" do 
            robot.set_direction("NORTH")
            expect(robot.direction).to eq("NORTH")
        end
    end        

    describe "#place" do
        it 'calls #set_position with [row, col]' do 
            expect(robot).to receive(:set_position).with([0,0])
            robot.place(0,0,"NORTH")
        end

        it 'calls #set_direction with "direction"' do 
            expect(robot).to receive(:set_direction).with("NORTH")
            robot.place(0,0,"NORTH")
        end

        it 'sets placed variable to be true ' do 
            expect(robot.is_placed?).to be false
            robot.place(0,0,"NORTH")
            expect(robot.is_placed?).to be true
        end
    end

    describe "#is_placed?" do 
        it 'returns false before the robot is placed' do 
            expect(robot.is_placed?).to be false 
        end 
        it 'returns true after the robot is placed' do
            robot.place(0,0,"NORTH")
            expect(robot.is_placed?).to be true
        end
    end

end
