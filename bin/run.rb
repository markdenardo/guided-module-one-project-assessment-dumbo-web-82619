#require_relative references and executes code that is not written in the run file
#the following is an example of a shortened string require relative path
require_relative '../config/environment'

#home page clears the screen using puts 'clear', outputs 3 messages then uses a gets chomp to advance to the next line via user input
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
          #uses the User.name() method from the edge class of User to query if the name exits using the .include? method from Ruby
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

      #Assigns the ActiveRecord method find_by to a variable name (this user). The name and password originate in the User class
      #this mirrors the data seeded to the database
      this_user = User.find_by(name: name, password: password)
      puts "hmm. maybe you want to change your username. tomorrow is Halloween.(yes/no)"
      response = gets.chomp
      if response == "yes" 
      puts `clear`
      puts "Please enter a new username."
      name = gets.chomp
      this_user.update(name: name)
      puts `clear`
      puts "OK your new username is #{this_user.name}"
      #insert Active 
      sleep(2)
      end
    end

      #game introduction    
      puts `clear`
      puts "Do you want to play a game? (yes/no)"
      puts "Right now we have coin toss."
      response = gets.chomp
            if response == "yes"
                  #evocation of the GameType.play() method which is declared in the GameType class which returns the conditional result of coin toss
                  #this code is on line 9 of GameType.class
                  result = GameType.play("coin toss")

                  #this is the game logic and UI of coin toss  
                  puts `clear`  
                  puts  "Ok. I just flipped the coin. Heads or Tails?"
                  response = gets.chomp
                      #in this example, I decided to make the value of true the value of heads and the false of false the value of tails

                      #this condition states if the user gets.chomp input is "Heads" and the GameType instance output is true that it is the same value in the game
                      if response == "Heads" && result == true
                        #this Active Record method .create updates a new instance of the game result, tagging the user and the game to the result, and pushing it to the SQLite3 database development.db
                        Result.create(user_id: this_user.id,game_type_id: GameType.first.id,won: true)
                        puts "You guessed right!"
                      elsif
                        #this condition states if the user gets.chomp input is "Tails" and the GameType instance output is false that it is the same value in the game
                        response == "Tails" && result == false
                        #this Active Record method .create updates a new instance of the game result, tagging the user and the game to the result, and pushing it to the SQLite3 database development.db
                        Result.create(user_id: this_user.id,game_type_id: GameType.first.id,won: true)
                        puts "You guessed right!"
                      else
                        #this Active Record method .create updates a new instance of the game result, tagging the user and the game to the result, and pushing it to the SQLite3 database development.db
                        Result.create(user_id: this_user.id,game_type_id: GameType.first.id,won: false)
                        puts "Sorry, wrong guess! :("
                      end  
                      #a wait command from Ruby which waits for 3 seconds in the argument
                      sleep(3)
            else 
            end     


              #stats introduction 
              puts `clear` 
              puts "Do you want to see your stats? (yes/no)"
              response = gets.chomp
                  if response == "yes"
                    puts "COIN TOSS stats: "
                    #evocation of an class method User.stats()
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
                      #evocation of the class method User.destroy_account() which uses an Active Record method to delete the account
                      #this method DOES NOT delete the results data :(
                      #User.destroy_account(this_user.name)
                      this_user.destroy
                    sleep(1)
                    end
                    puts "🎶Goodbye🎶"

              end

