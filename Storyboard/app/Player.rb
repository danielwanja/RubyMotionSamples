class Player
  attr_accessor :name
  attr_accessor :game
  attr_accessor :rating
  
  def self.default_players
    players = []
    player = Player.new
    player.name = "Bill Evans"
    player.game = "Tic-Tac-Toe"
    player.rating = 4
    players << player
    
    player = Player.new
    player.name = "Oscar Peterson"
    player.game = "Spine the Bottle"
    player.rating = 2
    players << player
    
    player = Player.new
    player.name = "Daniel Wanja"
    player.game = "Rock, Paper, Scissors"
    player.rating = 5
    players << player
    
    players
  end
end