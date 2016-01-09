require_relative 'player'
require_relative 'methods'




intro

#get player names
puts "Player 1's name: "
p1_name = gets.chomp
@player_1 = Player.new(p1_name)

puts "Player 2's name: "
p2_name = gets.chomp
@player_2 = Player.new(p2_name)

#start game
until game_over?
  math_question
  get_answer(@player_1)
  get_answer(@player_2)
  update_stats(@player_1)
  update_stats(@player_2)
  #show scoreboard
  announce
  if game_over?
    play_again?
  end
  check_winner
end


