require_relative 'methods'

#fogjaoifjgirojgaeirjgeajgoaei

@stop_play = false


#setting up
intro

get_names

#start the game
until @stop_play
  math_question
  get_p1_answer
  get_p2_answer
  calculate_stats
  announce
  if game_over?
    @stop_play = true unless play_again?
  end
end

check_winner






