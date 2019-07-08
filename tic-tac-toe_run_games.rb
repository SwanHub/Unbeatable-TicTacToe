
# method: run easy.

def run_game_easy_gamer_first
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""
    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]

       if $round_number > 1
         puts " "
         puts "                   ############"
         puts "                   ROUND: #{$round_number}"
         puts "                   ############"
       end

    loop do
      prompt_user(active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
      mid_game_chirp
      sleep(1)
      cpu_response_easy(available_positions, active_board, winning_combinations)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
    end
end

def run_game_easy_cpu_first
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""
    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]
     if $round_number > 1
       puts ""
       puts "                   #############"
       puts "                   ROUND: #{$round_number}"
       puts "                   #############"
     end

    loop do
      cpu_response_easy(available_positions, active_board, winning_combinations)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
      mid_game_chirp
      sleep(1)
      prompt_user(active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
    end
end

# method: run medium.

def run_game_medium_gamer_first
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""

    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]
     if $round_number > 1
       puts ""
       puts "                   ############"
       puts "                   ROUND: #{$round_number}"
       puts "                   ############"
     end

    loop do
      prompt_user(active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
      mid_game_chirp
      sleep(1)
      cpu_response_medium(winning_combinations, final_position_choice, available_positions, active_board)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
    end
end

def run_game_medium_cpu_first
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""
    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]
     if $round_number > 1
       puts ""
       puts "                   ############"
       puts "                   ROUND: #{$round_number}"
       puts "                   ############"
     end

    loop do
      cpu_response_medium(winning_combinations, final_position_choice, available_positions, active_board)
      
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
      mid_game_chirp
      sleep(1)
      prompt_user(active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
    end
end

# method: run hard.

def run_game_hard_gamer_first
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""

    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]
     if $round_number > 1
       puts ""
       puts "                   ############"
       puts "                   ROUND: #{$round_number}"
       puts "                   ############"
     end

    loop do
      prompt_user(active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
      mid_game_chirp
      sleep(1)
      cpu_response_hard(winning_combinations, final_position_choice, available_positions, active_board)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
    end
end

def run_game_hard_cpu_first
    available_positions = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
    active_board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
    final_position_choice = ""
    winning_combinations = [[:a1, :a2, :a3],
                            [:b1, :b2, :b3],
                            [:c1, :c2, :c3],
                            [:a1, :b1, :c1],
                            [:a2, :b2, :c2],
                            [:a3, :b3, :c3],
                            [:a1, :b2, :c3],
                            [:a3, :b2, :c1]]
     if $round_number > 1
       puts ""
       puts "                   ############"
       puts "                   ROUND: #{$round_number}"
       puts "                   ############"
     end

    loop do
      cpu_response_hard(winning_combinations, final_position_choice, available_positions, active_board)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
      mid_game_chirp
      sleep(1)
      prompt_user(active_board, available_positions, final_position_choice, winning_combinations)
      y_n = check_for_victor(winning_combinations, available_positions, active_board)
        if y_n == false
          break
        end
    end
end
