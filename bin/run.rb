#require_relative references and executes code that is not written in the run file
#the following is an example of a shortened string require relative path
require_relative '../config/environment'

#home page outputs 3 messages then uses a gets chomp to advance to the next line
puts `clear`
puts "COIN TOSS"
puts "press enter to start"
gets.chomp

  #introduction asks the user if they are new user; puts asks for a specific string of "yes" or "no"
  puts `clear`
  puts "Are you a new user? (yes/no)"
  #user name and password acquire via gets.chomp, a method built into ruby which collects user string input in terminal
  response = gets.chomp
    
    #this if /else conditional statement sets up the decision tree of creating a new User ID And Password
    if response == "yes"
      puts `clear`
      puts "Great! What is your name?"
      name = gets.chomp
      puts `clear`
      puts "What's your password"
      password = gets.chomp
      puts `clear`
          
          #until loop sets the conditions of the gets.chomp; User.names.include?(name) checks to see if the name of the new user matches any existing user in the database.
          #It will only end the loop when the User enters a :name which is not in development.rb
          until !User.names.include?(name)
          #a re-prompt, asking for a unique username. If the user doesn't give a unique username this loop will not end
          puts "that name exist. please give another name. try something fun!"
          name = gets.chomp
          puts `clear`
          puts "What's your password"
          password = gets.chomp
          puts `clear`    
          end
          #this next line of code assigns the new instance of user and attributes to SQL via ActiveRecord, and saves it to this_user
          this_user = User.create(name: name, password: password)

    #This is the second part of the initial conditional statement which starts at line 18.
    else
      puts `clear`
      puts "Welcome back, returning user. What is your name?"
      name = gets.chomp
      puts `clear`
      puts "What's your password"
      password = gets.chomp 
      #Assigns the ActiveRecord method find_by to a variable name (this user). The name and password originate in the User class,
      this_user = User.find_by(name: name, password: password)
    end

      #game introduction    
      puts `clear`
      puts "Do you want to play a game? (yes/no)"
      puts "Right now we have coin toss."
      response = gets.chomp
            if response == "yes"
                  #this method is a 
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
                    sleep(2)
                    puts `clear`
                    #This is where the this_user.name is deleted
                    puts "Do you want to delete your account?(yes/no)"
                    response = gets.chomp
                    if response == "yes"
                      puts `clear`
                      User.destroy_account(this_user.name)
                    sleep(1)
                    end
                    puts "🎶Goodbye🎶"

              end

