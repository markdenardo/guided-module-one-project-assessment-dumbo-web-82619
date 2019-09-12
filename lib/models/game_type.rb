#example of an assignment of attributes from ActiveRecord to GameType
class GameType < ActiveRecord::Base
    #domain modeling associations expressed through active record which will allow the joiner class and edge class to be able to read instances of self.play()
    has_many :results
    has_many :users, through: :results
    #this class method is the both the state machine for potential new games, due to conditional statements
    #and the "game engine" for "coin toss"
    def self.play(name)
        if name == "coin toss"
            #a .sample method which samples evenly btw true and false
            [true, false].sample
        end
        #if name =="dungeon"
        #[true, true, false].sample
    end


end
