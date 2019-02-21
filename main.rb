require 'pry'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'bank'
require_relative 'card'
require_relative 'cards_deck'
require_relative 'calculator'
require_relative 'game'

game = Game.new
game.play_game
loop do
  puts 'Continue?(y/n)'
  choise = gets.chomp
  choise == 'y' ? game.play_game : break
end
