require_relative "./../lib/game"
game = Game.new
inputs = ["PLACE 0,0,NORTH","LEFT","REPORT"]
game.run(inputs)