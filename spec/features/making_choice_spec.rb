require 'spec_helper'
require_relative 'helpers.rb'

feature 'making a choice' do

  scenario 'after making a choice you see your choice' do
    nicola_chooses_rock
    expect(page).to have_content 'Nicola, you chose Rock'
  end

  scenario 'after making a choice you see your opponent\'s name and choice' do
    nicola_chooses_rock
    expect(page).to have_content 'Computer, chose'
  end

end
