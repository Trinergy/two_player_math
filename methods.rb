

#Ali says: method should always do one thing
#thanks for the great advice


require 'colorize'


def intro
  puts "\nI want to play a game...\n".light_red
  puts "Between the two of you, each of you have three lives.\b
  I will ask you a random math question and you will each provide an answer.\b
  When you answer incorrectly, you lose a life.\b
  When you answer correctly, you live... for now.\b
  Before we start, I want to know what to engrave on your gravestone.\n".yellow
end

def get_name(player)
  puts "What is #{player}'s name?".light_cyan
  gets.chomp
end

def math_question
  number_1 = rand(1..20)
  number_2 = rand(1..20)
  syms = [:+, :-, :*, :/]
  oper = syms.sample
  @answer = number_1.send(oper, number_2).to_s
  puts "\nWhat is #{number_1} #{oper} #{number_2}?\n".light_yellow
  puts "(answer with no decimal places!)\n".light_blue
end


def correct_input?(number)
  case number
    when /\d+/
      return true
    else
      return false
    end
  end


def get_answer(player)
  player_name = player.name
  puts "#{player_name}'s answer is: ".light_cyan
  answer = gets.chomp
  player.answer = answer
end


def correct?(player)
  player.answer == @answer
end


def update_stats(player)
  if correct?(player)
    player.gain_score
    player.correct = true
  else
    player.lose_life
  end
end


def announce
  p1_result = @player_1.correct ? "correct" : "wrong"
  p2_result = @player_2.correct ? "correct" : "wrong"

  puts "\n\nLet's see the resuls!! \n\n".light_green
  puts "#{@player_1.name}'s answer was #{p1_result}! \b  
  Current life: #{@player_1.life} \b
  Current score: #{@player_1.score} \b
  #{@player_1.name}'s answer: #{@player_1.answer} \b
  Correct answer: #{@answer} \n
  #{@player_2.name}'s answer was #{p2_result}! \b
  Current life: #{@player_2.life} \b
  Current score: #{@player_2.score} \b
  #{@player_2.name}'s answer: #{@player_2.answer} \b
  Correct answer: #{@answer} \n".green
end


def game_over?
  @player_1.life == 0 || @player_2.life == 0
end


def check_winner
  if game_over?
    if @player_1.score > @player_2.score
      puts "#{@player_1.name} is VICTORIOUS".colorize(:color => :red, :background => :light_yellow)
    elsif @player_2.score > @player_1.score
      puts "#{@player_2.name} is VICTORIOUS".colorize(:color => :red, :background => :light_yellow)
    else
      puts "\nIt's a TRAP!!!! I mean.. DRAW!!\n".colorize(:color => :light_blue, :background => :red)
    end
  end
end   


def play_again?
  puts "\nLOL!! OVER ALREADY?! SO BAD!! play again? yes/no?\n".colorize(:color => :blue, :background => :red)
  reply = gets.chomp
  case reply
  when "yes"
    @player_1.life_reset
    @player_2.life_reset
    puts "\nready to lose again?\n"
    return true
  when "no" then false
  else
    play_again?
  end
end


# #Learn from failures


#     # puts "Can you read? play again? yes/no?"
#     # reply = gets.chomp
  
# #   if @stop_play
# #     puts "\nplay again? yes/no\n"
# #     reply = gets.chomp
# #     while !check
# #       case reply
# #       when /(\s+)?(^[yY][eE][sS])(\s+)/
# #         @player_1[:life] = 3
# #         @player_2[:life] = 3
# #         @stop_play = false
# #         check = true
# #       when /(\s+)?(^[nN][oO])(\s+)/
# #         check = true
# #       else
# #         puts "give me a proper answer!\nplay again? yes/no\n"
# #         reply = gets.chomp
# #       end
# #     end
# #   end
# # end



# def calculate_stats
#   if @player_1.answer == @answer
#     @player_1.gain_score
#     @player_1.correct = true
#   else
#     @player_1.lose_life
#     @player_1.correct = false
#   end
#   if @player_2.answer == @answer
#     @player_2.gain_score
#     @player_2.correct = true
#   else
#     @player_2.lose_life
#     @player_2.correct = false
#   end
# end


# def get_p1_answer
#   puts "#{@player_1.name}'s answer is:"
#   p1_ans = gets.chomp
#   p1_ans
# end


# def get_p2_answer
#   puts "#{@player_2.name}'s answer is: "
#   p2_ans = gets.chomp
#   p2_ans
# end













