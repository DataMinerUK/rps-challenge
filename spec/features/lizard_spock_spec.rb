require 'spec_helper'
require_relative 'helpers.rb'

feature 'extending the game to Rock Paper Scissors Lizard Spock' do

  scenario 'at start a player can choose to play this advanced version' do
    nicola_in_single_player_advanced_mode
    expect(page).to have_content 'Lizard poisons Spock'
  end

  scenario 'Spock loses to Lizard' do
    nicola_in_single_player_advanced_mode
    choose('lizard', :match => :first)
    allow($game.player_2).to receive(:choice).and_return('spock')
    click_button('Choose')
    expect(page).to have_content 'Lizard poisons Spock'
  end

  scenario 'Spock beats Scissors' do
    nicola_in_single_player_advanced_mode
    choose('spock', :match => :first)
    allow($game.player_2).to receive(:choice).and_return('scissors')
    click_button('Choose')
    expect(page).to have_content 'Spock smashes Scissors'
  end

  scenario 'Spock loses to Paper' do
    nicola_in_single_player_advanced_mode
    choose('spock', :match => :first)
    allow($game.player_2).to receive(:choice).and_return('paper')
    click_button('Choose')
    expect(page).to have_content 'You lost'
  end

  scenario 'Lizard beats Paper' do
    nicola_in_single_player_advanced_mode
    choose('lizard', :match => :first)
    allow($game.player_2).to receive(:choice).and_return('paper')
    click_button('Choose')
    expect(page).to have_content 'You won'
  end

end
