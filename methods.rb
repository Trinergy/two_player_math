


require 'pry'


@player_1 = {name: "", life: 3, score: 0, answer: 0, correct: false}
@player_2 = {name: "", life: 3, score: 0, answer: 0, correct: false}
@answer = 0


#Ali says: method should always do one thing

def intro
  puts "\nI want to play a game...\n
  Between the two of you, each of you have three lives.\b
  I will ask you a random math question and you will each provide an answer.\b
  When you answer incorrectly, you lose a life.\b
  When you answer correctly, you live... for now.\b
  Before we start, I want to know what to engrave on your gravestone.\n"
end

def get_names
  puts "Player 1, what is your name?\n"
  @player_1[:name] = gets.chomp
  puts "Player 2, what is your name?\n"
  @player_2[:name] = gets.chomp
end


def math_question
  number_1 = rand(20)
  number_2 = rand(20)
  @answer = number_1 + number_2
  puts "\nWhat is #{number_1} + #{number_2}?\n\n"
end


def get_p1_answer
  puts "#{@player_1[:name]}'s answer is:"
  p1_ans = gets.chomp
  check = false

  while check != true
  case p1_ans
    when /\d+/
      @player_1[:answer] = p1_ans.to_i
      check = true
    else
      puts "are you even trying?"
      p1_ans = gets.chomp
    end
  end
end


def get_p2_answer
  puts "#{@player_2[:name]}'s answer is:"
  p2_ans = gets.chomp
  check = false

  while check != true
  case p2_ans
    when /\d+/
      @player_2[:answer] = p2_ans.to_i
      check = true
    else
      puts "are you even trying?"
      p2_ans = gets.chomp
    end
  end
end


def calculate_stats
  if @player_1[:answer] == @answer
    @player_1[:score] += 1
    @player_1[:correct] = true
  else
    @player_1[:life] -= 1
    @player_1[:correct] = false
  end
  if @player_2[:answer] == @answer
    @player_2[:score] += 1
    @player_2[:correct] = true
  else
    @player_2[:life] -= 1
    @player_2[:correct] = false
  end
end


def announce
  p1_result = @player_1[:correct] ? "correct" : "wrong"
  p2_result = @player_2[:correct] ? "correct" : "wrong"

  puts "\n\nLet's see the resuls!! \n\n
  #{@player_1[:name]}'s answer was #{p1_result}! \b  
  Current life: #{@player_1[:life]} \b
  Current score: #{@player_1[:score]} \b
  #{@player_1[:name]}'s answer: #{@player_1[:answer]} \b
  Correct answer: #{@answer} \n
  #{@player_2[:name]}'s answer was #{p2_result}! \b
  Current life: #{@player_2[:life]} \b
  Current score: #{@player_2[:score]} \b
  #{@player_2[:name]}'s answer: #{@player_2[:answer]} \b
  Correct answer: #{@answer} \n"
end


def game_over?
  @player_1[:life] == 0 || @player_2[:life] == 0
end


def check_winner
  if @stop_play
    if @player_1[:score] > @player_2[:score]
      puts "#{@player_1[:name]} IS VICTORIOUS"
    elsif @player_2[:score] > @player_1[:score]
      puts "#{@player_2[:name]} IS VICTORIOUS"
    else
      puts "\nIt's a TRAP!!!! I mean.. DRAW!!\n"
    end
  end
end


def play_again?
  puts "\nYou suck, play again? yes/no?\n"
  reply = gets.chomp
  case reply
  when "yes"
    @player_1[:life] = 3
    @player_2[:life] = 3
    puts "\nready to lose?\n"
    return true
  when "no" then false
  else
    play_again?
  end
end


#Learn from failures
    # puts "Can you read? play again? yes/no?"
    # reply = gets.chomp
  
#   if @stop_play
#     puts "\nplay again? yes/no\n"
#     reply = gets.chomp
#     while !check
#       case reply
#       when /(\s+)?(^[yY][eE][sS])(\s+)/
#         @player_1[:life] = 3
#         @player_2[:life] = 3
#         @stop_play = false
#         check = true
#       when /(\s+)?(^[nN][oO])(\s+)/
#         check = true
#       else
#         puts "give me a proper answer!\nplay again? yes/no\n"
#         reply = gets.chomp
#       end
#     end
#   end
# end

















