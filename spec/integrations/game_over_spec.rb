require './lib/game.rb'

describe 'Ending the game' do

  it 'the game is over when both opponents have made a choice' do

    game = Game.new Player, RPS
    game.player_1.choice = 'scissors'
    game.player_2.choice = 'rock'
    expect(game).to be_over

  end
end
