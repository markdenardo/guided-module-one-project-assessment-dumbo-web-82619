#an example of class inheritence; "<" allows class User to inherit all the methods of Active Record
class User < ActiveRecord::Base
    
    #an example of Active Record creating read/write associations via the has_many method; 
    #this edge class can now see :results(joiner model), and :game_types(edge class) instances when called in methods inside this class
    has_many :results
    has_many :game_types, through: :results
    
    #an example of a class method which uses enumerable methods to access an instance of results through the joiner class, result
    def self.stats(name)
        
        #example of method creating a helper method to find an instance of the User Class by :name and assign the value to the variable user
        #user=User.find_by(name: "Jack") =>  #<User:0x00007f97c0426cd8 id: 88, name: "Jack", password: "jackfruit">
        user = User.find_by(name: name)

        #example of map method iterating through the array of an instance of user's results and assigning it to a new array
        #array=user.results.map{|result|result.won} => [true, true, true, false]
        array = user.results.map do |result|
        result.won
        end
        #example of select method reducing array to produce only the win results, which are designed to be true in this project
        #array2=array.select{|result|result==true} => [true, true, true]
        array2 = array.select do |result|
        result == true
        end
        
        #example of select method reducing the array to produce only the win results, which are designed to be true in this project
        array3 = array.select do |result|
        result != true
        end
        
        # returns arrays of wins and losses for the instance, string interpolates, and reduces to an integer using .count
        puts "#{array2.count} wins"
        puts "#{array3.count} losses"
     #this is the final line of this class method   
    end
    
    #uses the helper code from line 14, which should be refactored because OOP :), 
    #to find the user instance and destroys that user column using the ActiveRecord method .destroy
    # def self.destroy_account(name)
    #     user = User.find_by(name: name)
    #     user.destroy
    #     puts "Your account is deleted. :)"
    # end
    
    
    #a helper method used for run.rb which returns an array of all the user instances of :name which are in the SQL database
    def self.names
        self.all.map do |user|
            user.name
        end
    end

    def GameType.users

    end

         
end
