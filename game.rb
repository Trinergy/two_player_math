require_relative 'player'
require_relative 'methods'




intro

# #get player names
# puts "Player 1's name: ".light_cyan
# p1_name = gets.chomp
# @player_1 = Player.new(p1_name)

# puts "Player 2's name: ".light_magenta
# p2_name = gets.chomp
# @player_2 = Player.new(p2_name)

names_okay = false

until names_okay
  begin
    @player_1 = Player.new(get_name("player_1"))
    puts "You can read!"
    names_okay = true
  rescue Player::NameNotValid => e
    puts "Do you even read, bro?"
    puts e.message
  end
end

names_okay = false

until names_okay
  begin
    @player_2 = Player.new(get_name("player_2"))
    puts "You can read!"
    names_okay = true
  rescue Player::NameNotValid => e
    puts "Do you even read, bro?"
    puts e.message
  end
end

# @player_2 = Player.new(get_name("player_2"))





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


