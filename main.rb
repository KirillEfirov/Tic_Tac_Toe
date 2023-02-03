require_relative 'game.rb'

game

loop do
  puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
  repeat_input = gets.chomp.downcase

  repeat_input == 'y' ? game : break
end