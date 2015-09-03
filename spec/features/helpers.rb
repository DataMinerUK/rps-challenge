def visit_site
  $game = nil
  visit '/'
end

def nicola_starts_game
  click_button('Start Game')
  fill_in('name', with: 'Nicola')
  click_button('Submit')
end

def nicola_in_single_player_advanced_mode
  visit_site
  choose('advanced')
  choose ('single')
  nicola_starts_game
end

def nicola_selects_rock
  visit_site
  choose('single')
  nicola_starts_game
  choose('rock')
end

def nicola_chooses_rock
  nicola_selects_rock
  click_button('Choose')
end
