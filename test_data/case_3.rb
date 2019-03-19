require_relative "./../lib/game"
game = Game.new
inputs = ["PLACE 1,2,EAST","MOVE", "MOVE", "LEFT", "MOVE", "REPORT"]
game.run(inputs)