require_relative '../config/environment'

puts `clear`
puts "COIN TOSS"
puts "press enter start"
gets.chomp

#introduction
  puts `clear`
  puts "Are you a new user? (yes/no)"

  #user name and password acquire  
  response = gets.chomp
      if response == "yes"
          puts `clear`
          puts "Great! What is your name?"
          name = gets.chomp
          puts `clear`
          puts "What's your password"
          password = gets.chomp
          puts `clear`
          until !User.names.include?(name)
              puts "that name exist. please give another name. try something fun!"
              name = gets.chomp
              puts `clear`
              puts "What's your password"
              password = gets.chomp
              puts `clear`    
              end
          this_user = User.create(name: name, password: password)

        else
          puts `clear`
          puts "You must be a returning user. What is your name?"
          name = gets.chomp
          puts `clear`
          puts "What's your password"
          password = gets.chomp 
          
          this_user = User.find_by(name: name, password: password)
        end

      #game introduction    
      puts `clear`
      puts "Do you want to play a game? (yes/no)"
      puts "Right now we have coin toss."
      response = gets.chomp
            if response == "yes"
                  result = GameType.play("coin toss")
          
                  puts `clear`  
                  puts  "Ok. I just flipped the coin. Heads or Tails?"
                  response = gets.chomp
                      if response == "Heads" && result == true
                        Result.create(user_id: this_user.id,game_type_id: GameType.first.id,won: true)
                        puts "You guessed right!"
                      elsif
                        response == "Tails" && result == false
                        Result.create(user_id: this_user.id,game_type_id: GameType.first.id,won: true)
                        puts "You guessed right!"
                      else
                        Result.create(user_id: this_user.id,game_type_id: GameType.first.id,won: false)
                        puts "Sorry, wrong guess! :("
                      end  
                    sleep(3)
              else 
              end     


      #stats introduction 
              puts `clear` 
              puts "Do you want to see your stats? (yes/no)"
              response = gets.chomp
                  if response == "yes"
                    puts "COIN TOSS stats: "
                    User.stats(this_user.name)
                  else
                    puts `clear`
                    puts "Hmm, maybe you just want to hang out and not play any games."
                    puts "Let's take a break from our computers. lol"
                    puts "Do you want to delete your account?(yes/no)"
                    response = gets.chomp
                    if response == "yes"
                      User.destroy_account(this_user.name)
                    end
                  end

