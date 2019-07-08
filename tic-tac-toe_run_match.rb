# method:(run_match).

def run_match

  if $e_med_hard == 'easy'

    while $keep_playing == true

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
              run_game_easy_gamer_first
          elsif order_answer == "2"
              run_game_easy_cpu_first
          elsif order_answer == "$"
              cpu_or_gamer = rand(0...100) % 2
              if cpu_or_gamer == 1
                puts " "
                puts "      ##############################"
                puts "      YOU GO FIRST #{$name}"
                puts "      ##############################"
                puts " "
                run_game_easy_gamer_first
              elsif cpu_or_gamer == 0
                puts " "
                puts "      ##############"
                puts "      I'LL GO FIRST."
                puts "      ##############"
                puts " "
                run_game_easy_cpu_first
              end
          end
        puts " "
        puts "                   LET'S GO AGAIN, MY FRIEND!"
        puts " "
        $round_number += 1
        $keep_playing = true
      end

  elsif $e_med_hard == 'medium'

      while $keep_playing == true

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
                run_game_medium_gamer_first
              elsif order_answer == "2"
                puts " "
                puts "      ############"
                puts "      GAME ON. HERE GOES, ME FIRST."
                puts "      ############"
                puts " "
                run_game_medium_cpu_first
              elsif order_answer == "$"
                cpu_or_gamer = rand(0...100) % 2
                if cpu_or_gamer == 1
                  puts " "
                  puts "      ##############################"
                  puts "      YOU GO FIRST #{$name}"
                  puts "      ##############################"
                  puts " "
                  run_game_medium_gamer_first
                elsif cpu_or_gamer == 0
                  puts " "
                  puts "      ##############"
                  puts "      I'LL GO FIRST."
                  puts "      ##############"
                  puts " "
                  run_game_medium_cpu_first
                end
            end
            puts " "
            puts "                   LET'S GO AGAIN, MY FRIEND!"
            puts " "
            $round_number += 1
            $keep_playing = true
          end

  elsif $e_med_hard == 'hard'

    while $keep_playing == true

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
              run_game_hard_gamer_first
            elsif order_answer == "2"
              puts " "
              puts "      ############"
              puts "      GAME ON. HERE GOES, ME FIRST."
              puts "      ############"
              puts " "
              run_game_hard_cpu_first
            elsif order_answer == "$"
              cpu_or_gamer = rand(0...100) % 2
              if cpu_or_gamer == 1
                puts " "
                puts "      ##############################"
                puts "      YOU GO FIRST #{$name}"
                puts "      ##############################"
                puts " "
                run_game_hard_gamer_first
              elsif cpu_or_gamer == 0
                puts " "
                puts "      ##############"
                puts "      I'LL GO FIRST."
                puts "      ##############"
                puts " "
                run_game_hard_cpu_first
              end
          end
          puts " "
          puts "                   LET'S GO AGAIN, MY FRIEND!"
          puts " "
          $round_number += 1
          $keep_playing = true
        end # while

    end # if easy_med_hard

end # run_match
