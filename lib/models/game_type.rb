class GameType < ActiveRecord::Base
    has_many :results
    has_many :users, through: :results

    def self.play(name)
        if name == "coin toss"
            #in this case true is heads and false is tails 
            [true, false].sample
        end
        #if name =="dungeon"
    end


end
