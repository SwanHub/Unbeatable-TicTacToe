# easy. (random)

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

# medium. (very similar in difficulty to "hard"... )

def cpu_response_medium(winning_combinations, final_position_choice, available_positions, active_board)

  cpu_scores_by_pos_array = []

  if available_positions.length == 1
    active_board[available_positions[0]] = "O"
    update_winning_combinations_cpu(winning_combinations, available_positions[0])
    available_positions.delete(available_positions[0])
  else

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

      ## simulate choosing an available piece, one by one.
      available_positions_sim.each do |avail_pos|

        win_combo_w_available_position_sim = winning_combinations_sim.map do |array|
          array.map do |el|
              if el == avail_pos
                el = "cpu"
              else
                el
              end
          end
        end
        #=> an array of arrays, the inner arrays include "cpu" instead of "a1"

        # now we calculate the gamer_score and cpu_score of the field for this chosen position.
        cpu_score = 0
        gamer_score = 0

            ## gamer scoring
              win_combo_w_available_position_sim.each do |a|
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
              win_combo_w_available_position_sim.each do |a|
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

              cpu_scores_by_pos_array.push(cpu_score - gamer_score)
          end

          # get id of the max value.
          max_value_index = cpu_scores_by_pos_array.index(cpu_scores_by_pos_array.max)

          active_board[available_positions[max_value_index]] = "O"
          update_winning_combinations_cpu(winning_combinations, available_positions[max_value_index])
          available_positions.delete(available_positions[max_value_index])
        end

    end

# hard. (based on the next move.)

def cpu_response_hard(winning_combinations, final_position_choice, available_positions, active_board)

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
