# welcome msg & prompts.

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

offered_name = $gamer_name_array[rand(0...$gamer_name_array.length)]

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
    $name = offered_name
  else
    $name = name_answer
  end

puts " "
puts "      ##############################"
puts "      Type: 'easy', 'medium' or 'hard' for DIFFULTY LVL."
puts "      ##############################"
puts " "

puts "##########"
$e_med_hard = gets.chomp
puts "##########"
puts " "
