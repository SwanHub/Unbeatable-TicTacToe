# update board, check for victor.

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

def check_for_victor(winning_combinations, available_positions, active_board)

  if available_positions.length == 0
    $win_record[:ties] += 1
    display_board(active_board)
    puts " "
    puts "                     draw. Stalemate. Attrition. Well fought. Again?"
    display_leaderboard

    loop do
      puts "                   Do you want to play again? ('yes' or 'no')"
      puts "##########"
      answer = gets.chomp
      puts "##########"
      if answer == 'no'
        exit
      elsif answer == 'yes'
        $keep_playing = false
        return $keep_playing
      end
    end
  end

  winning_combinations.each do |array|
     if array.count("gamer") == 3
       $win_record[:wins] += 1
       display_board(active_board)
       puts " "
       puts "I see you, #{$name}"
       puts "wow... I didn't think this was possible."
       display_leaderboard

       loop do
         puts "                 Do you want to play again? ('yes' or 'no')"
         puts "##########"
         answer = gets.chomp
         puts "##########"
         if answer == 'no'
           exit
         elsif answer == 'yes'
           $keep_playing = false
           return $keep_playing
         end
       end

    elsif array.count("cpu") == 3
      $win_record[:losses] += 1

      display_board(active_board)
      puts " "
      puts "                   ouch, that's a loss for you. Win for me. Again?"
      puts " "
      puts "                   The leaderboard:"
      display_leaderboard

        loop do
          puts "                   Do you want to play again? ('yes' or 'no')"
          puts "##########"
          answer = gets.chomp
          puts "##########"
          if answer == 'no'
            exit
          elsif answer == 'yes'
            $keep_playing = false
            return $keep_playing
          end
        end
     end
  end
end
