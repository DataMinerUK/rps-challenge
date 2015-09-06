# Rock Paper Scissors

[![Build Status](https://travis-ci.org/DataMinerUK/rps-challenge.svg?branch=master)](https://travis-ci.org/DataMinerUK/rps-challenge)  [![Coverage Status](https://coveralls.io/repos/DataMinerUK/rps-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/DataMinerUK/rps-challenge?branch=master) [![Code Climate](https://codeclimate.com/github/DataMinerUK/rps-challenge/badges/gpa.svg)](https://codeclimate.com/github/DataMinerUK/rps-challenge)

Ruby implementation of the game Rock, Paper, Scissors with advanced Rock, Paper, Scissors, Lizard, Spock mode. Lovingly built using Sinatra and Bootstrap. Tested with Rspec and Capybara

## Play

User can select normal or advanced level. Advanced level uses these [rules](http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock). She can also select to play the computer (single player) or another player (multi player).

![Alt text][RPS-index]

User is asked to enter her name

![Alt text][RPS-name]

She can then decide what object she wants to play depending on what level she has chosen. If multi player mode is selected the game result is not shown until her opponent has made his choice.

![Alt text][RPS-choice]

Outcome is given with named opponent and the rule related to the outcome

![Alt text][RPS-outcome]

## Getting Started

```sh
git clone https://github.com/DataMinerUK/rps-challenge
cd rps-challenge
bundle install
rackup -p4567 --host 0.0.0.0 #The switches are needed when running off a VM
```
and go to localhost:4567 on your machine.

## Testing

Run Rspec

```sh
rspec
```

# Implementation

[v1.0](https://github.com/DataMinerUK/rps-challenge/releases/tag/v1.0)
------

Single player mode against the computer. [Player class](https://github.com/DataMinerUK/rps-challenge/blob/master/lib/player.rb) only has attributes of name, choice and opponent. The [Game class](https://github.com/DataMinerUK/rps-challenge/blob/master/lib/game.rb) runs the game logic (here done mathematically such that the game engine can be extended to use Spock and Lizard options). The logic is such that if all options are ordered such that, when wrapped circularly, each option beats half the remaining elements counter clockwise and loses to the other half clockwise then the logic (your choice - opponents choice) modulus number of choices is greater than 0 and less than or equal to the number of choices divided by two.

[v2.0](https://github.com/DataMinerUK/rps-challenge/releases/tag/v2.0)
------

Multi player mode. Here the logic in the controller sets it such that once one player chooses a multi player game than the next person into the game joins that game at the point where they set their name. The outcome cannot be given until both players make their choice. A while loop has been used in the controller to keep the page trying to load until both players have made their move.

[v3.0](https://github.com/DataMinerUK/rps-challenge/releases/tag/v3.0)
------

Advanced mode Rock Paper Scissors Lizard Spock has been implemented by creating a `Game::RulesOptions` class within Game which allows the controller to set new rules and options.

[v4.0](https://github.com/DataMinerUK/rps-challenge/releases/tag/v4.0)
-----

Refactored to use the strategy pattern. This required making a module to contain the game [dynamics](https://github.com/DataMinerUK/rps-challenge/blob/master/lib/dynamics.rb) and include this in a module for [Rock, Paper, Scissors](https://github.com/DataMinerUK/rps-challenge/blob/master/lib/rps.rb) and [Rock, Paper, Scissors, Lizard, Spock](https://github.com/DataMinerUK/rps-challenge/blob/master/lib/rpls.rb). All these need to contain are the rules and options for each game version. Now, when a Game is instanciated it takes two arguments; the Player class and the version module. The [module is included](https://github.com/DataMinerUK/rps-challenge/blob/master/lib/game.rb#L12) on instanciation.

[RPS-index]: http://i569.photobucket.com/albums/ss131/nicola_hughes1/Screen%20Shot%202015-09-06%20at%206.50.00%20PM_zpsatb43n0r.png
[RPS-name]: http://i569.photobucket.com/albums/ss131/nicola_hughes1/Screen%20Shot%202015-09-06%20at%208.48.58%20PM_zpsx0rr2gje.png
[RPS-choice]: http://i569.photobucket.com/albums/ss131/nicola_hughes1/Screen%20Shot%202015-09-06%20at%209.10.17%20PM_zpsyngqxlth.png
[RPS-outcome]: http://i569.photobucket.com/albums/ss131/nicola_hughes1/Screen%20Shot%202015-09-06%20at%209.10.35%20PM_zps23n5schb.png
