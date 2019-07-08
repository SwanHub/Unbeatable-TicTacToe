# global variables.

$round_number = 1
$gamer_name_array = ["PUNK",
                    "LAMESAUCE",
                    "LAMEBUTT",
                    "CRABHANDS",
                    "NOOB",
                    "BUNS MCGEE",
                    "BUNS 4 DAYS"]
$name = ""
$keep_playing = true
$win_record = { wins: 0, losses: 0, ties: 0 }
$cpu_chatter = ["I'm in your head.",
               "You can't beat me.",
               "My algorithms are unbeatable.",
               "This is a pre-programmed delay.",
               "Ever heard of the bench?",
               "Yawn. Easy.",
               "You stink.",
               "Your outlook is dire."]

# message displays.

def mid_game_chirp
  puts " "
  puts "                   #{$cpu_chatter[rand(0...$cpu_chatter.length)]}"
  puts " "
end

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

def display_leaderboard
  puts " "
  puts "                   #{$name}: #{$win_record[:wins]}"
  puts "                   Queen CPU: #{$win_record[:losses]}"
  puts "                   Ties: #{$win_record[:ties]}"
  puts " "
end

# user prompt.

def prompt_user(active_board, available_positions, final_position_choice, winning_combinations)
  puts " "
  puts "                   #{$name}... here's the board:"
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
