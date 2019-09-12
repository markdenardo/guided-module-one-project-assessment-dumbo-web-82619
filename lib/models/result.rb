class Result < ActiveRecord::Base
    belongs_to :user
    belongs_to :game_type

   #there doesn't seem to be a lot going on here, but a lot is going on
   #without this joiner class providing information from the edge classes this app would not work
   #a refactoring task I'm considering is declaring a results method which does the same thing as
   #Result.create(user_id: this_user.id,game_type_id: GameType.first.id,won: boolean) in the run.rb file
    
end
