class User < ActiveRecord::Base
    has_many :results
    has_many :game_types, through: :results

    def self.stats(name)
        
        user = User.find_by(name: name)
            
        array = user.results.map do |result|
            #game, #of plays, #of wins
            result.won
        end
            
        array2 = array.select do |won|
        won == 1
        end
        
        array3 = array.reject do |loss|
        loss == 1
        end
        
        # add all of my results wins and losses together 
        puts "#{array2.count} wins"
        puts "#{array3.count} losses"
        
    end

    def self.destroy_account(name)
        user = User.find_by(name: name)
        user.destroy
        puts "Your account is deleted. :)"
    end

         
end
