                    # WELCOME TO THE GAME OF TIC-TAC-TOE. #
                    # FACE THE COMPUTER // FACE THE MUSIC. #

                      ####################################
                      ####### 'GLOBAL' VARIABLES #########
                      ####################################

  round_number = 1
  gamer_name_array = ["PUNK",
                      "LAMESAUCE",
                      "LAMEBUTT",
                      "CRABHANDS",
                      "NOOB",
                      "BUNS MCGEE",
                      "BUNS 4 DAYS"]
  keep_playing = true
  win_record = { wins: 0, losses: 0, ties: 0 }

                      ##################################
                      ####### DEFINING METHODS #########
                      ##################################

def display_board(hash)
  puts " "
  puts "                                1   2   3  "
  puts "                              a #{hash[:a1]} | #{hash[:a2]} | #{hash[:a3]} "
  puts "                                –––––––––"
  puts "                              b #{hash[:b1]} | #{hash[:b2]} | #{hash[:b3]} "
  puts "                                –––––––––"
  puts "                              c #{hash[:c1]} | #{hash[:c2]} | #{hash[:c3]} "
  puts " "
end

def display_help
  puts " "
  puts "                              a1 | a2 | a3 "
  puts "                               ––––––––––"
  puts "                              b1 | b2 | b3 "
  puts "                               ––––––––––"
  puts "                              c1 | c2 | c3 "
  puts " "
  puts "                   alright, now, what move would you like to make?"
end

def display_leaderboard(name, win_record)
  puts " "
  puts "                   #{name}: #{win_record[:wins]}"
  puts "                   Queen CPU: #{win_record[:losses]}"
  puts "                   Ties: #{win_record[:ties]}"
  puts " "
end

def update_winning_combinations_gamer(winning_combinations, final_position_choice)
  winning_combinations.map! do |array_i|
    array_i.map! do |element|
      if element == final_position_choice.to_sym
        element = "gamer"
      else
        element
      end
    end
  end
end

def update_winning_combinations_cpu(winning_combinations, final_position_choice)
  winning_combinations.map! do |array_i|
    array_i.map! do |element|
      if element == final_position_choice
        element = "cpu"
      else
        element
      end
    end
  end
end

def check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing, active_board)

  if available_positions.length == 0
    win_record[:ties] += 1
    display_board(active_board)
    puts " "
    puts "                     draw. Stalemate. Attrition. Well fought. Again?"
    display_leaderboard(name, win_record)

    loop do
      puts "                   Do you want to play again? ('yes' or 'no')"
      puts "##########"
      answer = gets.chomp
      puts "##########"
      if answer == 'no'
        exit
      elsif answer == 'yes'
        keep_playing = false
        return keep_playing
      end
    end
  end

  winning_combinations.each do |array|
     if array.count("gamer") == 3
       win_record[:wins] += 1
       display_board(active_board)
       puts " "
       puts "I see you, #{name}"
       puts "wow... I didn't think this was possible."
       display_leaderboard(name, win_record)

       loop do
         puts "                 Do you want to play again? ('yes' or 'no')"
         puts "##########"
         answer = gets.chomp
         puts "##########"
         if answer == 'no'
           exit
         elsif answer == 'yes'
           keep_playing = false
           return keep_playing
         end
       end

    elsif array.count("cpu") == 3
      win_record[:losses] += 1

      display_board(active_board)
      puts " "
      puts "                   ouch, that's a loss for you. Win for me. Again?"
      puts " "
      puts "                   The leaderboard:"
      display_leaderboard(name, win_record)

        loop do
          puts "                   Do you want to play again? ('yes' or 'no')"
          puts "##########"
          answer = gets.chomp
          puts "##########"
          if answer == 'no'
            exit
          elsif answer == 'yes'
            keep_playing = false
            return keep_playing
          end
        end
     end
  end
end

def cpu_response_hard(name, winning_combinations, final_position_choice, available_positions, active_board)

  if available_positions.length == 1
    active_board[available_positions[0]] = "O"
    update_winning_combinations_cpu(winning_combinations, available_positions[0])
    available_positions.delete(available_positions[0])
  else

      cpu_scores_by_pos_array = []

      ## simulate winning combinations.
      winning_combinations_sim = []
      winning_combinations.each do |array|
        winning_combinations_sim.push(array)
      end

      ## simulate active board.
      available_positions_sim = []
      available_positions.each do |a|
        available_positions_sim.push(a)
      end

        available_positions_sim.each do |avail_pos|

          ## simulate choosing an available piece.
            win_sim = winning_combinations_sim.map do |array|
              array.map do |el|
                  if el == avail_pos
                    el = "cpu"
                  else
                    el
                  end
              end
            end

          ### Create a simulated "new available_positions"
          new_avail_positions = []
          available_positions_sim.each do |a|
            if a != avail_pos
              new_avail_positions.push(a)
            end
          end

          ## each of these arrays will be pushed into cpu_scores_by_pos_array
          cpu_scores_by_pos = []

              new_avail_positions.each do |avail_pos_sim|
                ### cpu/gamer_score eventually be pushed into cpu_scores_by_pos
                cpu_score = 0
                gamer_score = 0
                ### sim_within_sim changing the board to "gamer"
                inception_sim = win_sim.map do |array|
                  array.map do |ar_el|
                      if ar_el == avail_pos_sim
                        ar_el = "gamer"
                      else
                        ar_el
                      end
                  end
                end
                ## gamer scoring
                  inception_sim.each do |a|
                    if a.include?("gamer") == true && a.include?("cpu") == false
                      if a.count("gamer") == 1
                      gamer_score += 2
                      elsif a.count("gamer") == 2
                      gamer_score += 10
                      elsif a.count("gamer") == 3
                      gamer_score += 100
                      end
                    elsif a.include?("gamer") == false && a.include?("cpu") == false
                      gamer_score += 0
                    elsif a.include?("gamer") == true && a.include?("cpu") == true
                      gamer_score += 0
                    end
                  end
                ## cpu scoring
                  inception_sim.each do |a|
                    if a.include?("cpu") == true && a.include?("gamer") == false
                      if a.count("cpu") == 1
                      cpu_score += 2
                    elsif a.count("cpu") == 2
                      cpu_score += 10
                    elsif a.count("cpu") == 3
                      cpu_score += 100
                      end
                    elsif a.include?("cpu") == false && a.include?("gamer") == false
                      cpu_score += 0
                    elsif a.include?("cpu") == true && a.include?("gamer") == true
                      cpu_score += 0
                    end
                  end
                  cpu_scores_by_pos.push(cpu_score - gamer_score)
              end
            cpu_scores_by_pos_array.push(cpu_scores_by_pos)
          end

          ### Array of minimum values for each potential move.
          cpu_score_min_array = []
          cpu_scores_by_pos_array.each do |array|
            cpu_score_min_array.push(array.min)
          end

          minimum_value = [cpu_score_min_array[0]]
          minimum_value_index = [0]
          cpu_score_min_array.each_with_index do |a, i|
            if a > minimum_value[0]
              minimum_value = [a]
              minimum_value_index = [i]
            elsif a == minimum_value [0]
              minimum_value.push(a)
              minimum_value_index.push(i)
            end
          end
          active_board[available_positions[minimum_value_index[0]]] = "O"
          update_winning_combinations_cpu(winning_combinations, available_positions[minimum_value_index[0]])
          available_positions.delete(available_positions[minimum_value_index[0]])
    end
end

def cpu_response_easy(available_positions, active_board, winning_combinations)
    if available_positions.length == 1
      active_board[available_positions[0]] = "O"
      update_winning_combinations_cpu(winning_combinations, available_positions[0])
      available_positions.delete(available_positions[0])
    else
      rand_position = available_positions[rand(0...available_positions.length)]
      active_board[rand_position] = "O"
      update_winning_combinations_cpu(winning_combinations, rand_position)
      available_positions.delete(rand_position)
  end
end

def prompt_user(name, active_board, available_positions, final_position_choice, winning_combinations)
  puts " "
  puts "                   #{name}... here's the board:"
  display_board(active_board)
  puts "                   Make your move. Type a position below."
  puts "                   Type 'help' for help."
        loop do
          puts " "
          puts "##########"
          position_choice = gets.chomp
          puts "##########"
          puts " "
          if position_choice == 'help'
              display_help()
          else
              if available_positions.include?(position_choice.to_sym) == true
                final_position_choice = position_choice
                break
              else
                puts "                   That's not a valid choice. Try again:"
              end
          end
        end
    active_board[final_position_choice.to_sym] = "X"
    update_winning_combinations_gamer(winning_combinations, final_position_choice)
    available_positions.delete(final_position_choice.to_sym)
end

def mid_game_chirp(cpu_chatter)
  puts " "
  puts "                   #{cpu_chatter[rand(0...cpu_chatter.length)]}"
  puts " "
end

def run_game_hard_gamer_first(keep_playing, round_number, win_record, name)
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""
    cpu_chatter = ["I'm in your head.",
                   "You can't beat me.",
                   "My algorithms are unbeatable.",
                   "This is a pre-programmed delay.",
                   "Ever heard of the bench?",
                   "Yawn. Easy.",
                   "You stink.",
                   "Your outlook is dire."]
    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]
     if round_number > 1
       puts "                   ############"
       puts "                   ROUND: #{round_number}"
       puts "                   ############"
     end

    loop do
      prompt_user(name, active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing, active_board)
        if y_n == false
          break
        end
      mid_game_chirp(cpu_chatter)
      sleep(1)
      cpu_response_hard(name, winning_combinations, final_position_choice, available_positions, active_board)
      y_n = check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing, active_board)
        if y_n == false
          break
        end
    end
end

def run_game_hard_cpu_first(keep_playing, round_number, win_record, name)
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""
    cpu_chatter = ["I'm in your head.",
                   "You can't beat me.",
                   "My algorithms are unbeatable.",
                   "This is a pre-programmed delay.",
                   "Ever heard of the bench?",
                   "Yawn. Easy.",
                   "You stink.",
                   "Your outlook is dire."]
    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]
     if round_number > 1
       puts "                   ############"
       puts "                   ROUND: #{round_number}"
       puts "                   ############"
     end

    loop do
      cpu_response_hard(name, winning_combinations, final_position_choice, available_positions, active_board)
      y_n = check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing, active_board)
        if y_n == false
          break
        end
      mid_game_chirp(cpu_chatter)
      sleep(1)
      prompt_user(name, active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing, active_board)
        if y_n == false
          break
        end
    end
end

def run_game_easy_gamer_first(keep_playing, round_number, win_record, name)
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""
    cpu_chatter = ["I'm in your head.",
                   "You can't beat me.",
                   "My algorithms are unbeatable.",
                   "This is a pre-programmed delay.",
                   "Ever heard of the bench?",
                   "Yawn. Easy.",
                   "You stink.",
                   "Your outlook is dire."]
    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]

       if round_number > 1
         puts " "
         puts "                   ############"
         puts "                   ROUND: #{round_number}"
         puts "                   ############"
       end

    loop do
      prompt_user(name, active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing, active_board)
        if y_n == false
          break
        end
      mid_game_chirp(cpu_chatter)
      sleep(1)
      cpu_response_easy(available_positions, active_board, winning_combinations)
      y_n = check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing, active_board)
        if y_n == false
          break
        end
    end
end

def run_game_easy_cpu_first(keep_playing, round_number, win_record, name)
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""
    cpu_chatter = ["I'm in your head.",
                   "You can't beat me.",
                   "My algorithms are unbeatable.",
                   "This is a pre-programmed delay.",
                   "Ever heard of the bench?",
                   "Yawn. Easy.",
                   "You stink.",
                   "Your outlook is dire."]
    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]
     if round_number > 1
       puts "                   #############"
       puts "                   ROUND: #{round_number}"
       puts "                   #############"
     end

    loop do
      cpu_response_easy(available_positions, active_board, winning_combinations)
      y_n = check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing, active_board)
        if y_n == false
          break
        end
      mid_game_chirp(cpu_chatter)
      sleep(1)
      prompt_user(name, active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(name, winning_combinations, available_positions, win_record, keep_playing,active_board)
        if y_n == false
          break
        end
    end
end

                      #################################
                      ###### WELCOME MSG/PROMPTS ######
                      #################################

  puts " "
  puts "                                 YO!"
  puts " "
  puts "      Welcome to the ultimate game of skill, TIC TAC TOE."
  puts "      Type 'game on' below in order to get started:"
  puts " "
  puts "##########"
  answer = gets.chomp
  puts "##########"
    if answer == 'game on'
      puts " "
      puts "      ###################"
      puts "      CHALLENGE ACCEPTED."
      puts "      ###################"
    else
      puts " "
      puts "      Are you sure you don't want to play? Type 'bye' to go away and 'play' to play on."
      puts " "
      puts "##########"
      second_answer = gets.chomp
      puts "##########"
      puts " "
      if second_answer == "bye"
        puts " "
        puts "      Tut! Tut! Tut! Fair enough! Goodbye, then!"
        exit
      elsif second_answer == "play"
        puts " "
        puts "      I knew you'd come around."
        puts " "
      else
        puts " "
        puts "      Can't even follow the simplest of directions? I'm out."
        exit
      end
    end

  offered_name = gamer_name_array[rand(0...gamer_name_array.length)]

  puts " "
  puts "      First thing is first: Do you have a name? Or would you rather go by:"
  puts " "
  puts "                               '#{offered_name}'?"
  puts " "
  puts "      Type 'keep' to keep your given name, or else type the name you prefer:"
  puts " "
  puts "##########"
  name_answer = gets.chomp
  puts "##########"
    if name_answer == 'keep'
      name = offered_name
    else
      name = name_answer
    end

  puts " "
  puts "      ##############################"
  puts "      Type: 'easy' for EASY mode and 'hard' for HARD mode."
  puts "      ##############################"
  puts " "

  puts "##########"
  e_or_hard = gets.chomp
  puts "##########"
  puts " "


def run_match(e_or_hard, keep_playing, win_record, name, round_number)

  if e_or_hard == 'easy'
    while keep_playing == true

        puts "      ##########################"
        puts "      here are your options: "
        puts "        type '1' to go first"
        puts "        type '2' to go second"
        puts "        type '$' to flip a coin"
        puts "      ##########################"
        puts " "
        puts "##########"
          order_answer = gets.chomp
        puts "##########"
          if order_answer == "1"
              run_game_easy_gamer_first(keep_playing, round_number, win_record, name)
            elsif order_answer == "2"
              run_game_easy_cpu_first(keep_playing, round_number, win_record, name)
            elsif order_answer == "$"
              cpu_or_gamer = rand(0...100) % 2
              if cpu_or_gamer == 1
                puts " "
                puts "      ##############################"
                puts "      YOU GO FIRST #{name}"
                puts "      ##############################"
                puts " "
                run_game_easy_gamer_first(keep_playing, round_number, win_record, name)
              elsif cpu_or_gamer == 0
                puts " "
                puts "      ##############"
                puts "      I'LL GO FIRST."
                puts "      ##############"
                puts " "
                run_game_easy_cpu_first(keep_playing, round_number, win_record, name)
              end
          end
        puts " "
        puts "                   LET'S GO AGAIN, MY FRIEND!"
        puts " "
        round_number += 1
        keep_playing = true

      end
  elsif e_or_hard == 'hard'
    while keep_playing == true

        puts "      ##########################"
        puts "      here are your options: "
        puts "        type '1' to go first"
        puts "        type '2' to go second"
        puts "        type '$' to flip a coin"
        puts "      ##########################"
        puts " "
        puts "##########"
          order_answer = gets.chomp
        puts "##########"
          if order_answer == "1"
              puts " "
              puts "      ############"
              puts "      GAME ON. YOU'RE UP."
              puts "      ############"
              puts " "
              run_game_hard_gamer_first(keep_playing, round_number, win_record, name)
            elsif order_answer == "2"
              puts " "
              puts "      ############"
              puts "      GAME ON. HERE GOES, ME FIRST."
              puts "      ############"
              puts " "
              run_game_hard_cpu_first(keep_playing, round_number, win_record, name)
            elsif order_answer == "$"
              cpu_or_gamer = rand(0...100) % 2
              if cpu_or_gamer == 1
                puts " "
                puts "      ##############################"
                puts "      YOU GO FIRST #{name}"
                puts "      ##############################"
                puts " "
                run_game_hard_gamer_first(keep_playing, round_number, win_record, name)
              elsif cpu_or_gamer == 0
                puts " "
                puts "      ##############"
                puts "      I'LL GO FIRST."
                puts "      ##############"
                puts " "
                run_game_hard_cpu_first(keep_playing, round_number, win_record, name)
              end
          end
          puts " "
          puts "                   LET'S GO AGAIN, MY FRIEND!"
          puts " "
          round_number += 1
          keep_playing = true
        end
      end
end

                          #####################
                          ### PLAY THE GAME ###
                          #####################

run_match(e_or_hard, keep_playing, win_record, name, round_number)
