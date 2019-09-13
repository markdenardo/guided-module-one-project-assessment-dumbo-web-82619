#this is a re-seed of the SQLite3 database using the .destroy_all method
#the database ids do not reset, though, that would require a full rollback of the project
User.destroy_all
GameType.destroy_all
Result.destroy_all

#this seed group represents the schema for the edge class user
#it creates a new instance to a variable of the SQLit3 database file development.db
#it passes the values of name and password
jack = User.create(name: "Jack",password:"jackfruit")     
jane = User.create(name: "Jane",password: "janefruit")     
james = User.create(name: "James",password:"jamesfruit")   
jj = User.create(name: "JJ",password: "jjfruit")
rei = User.create(name: "Rei", password: "yo")
kevin = User.create(name: "KevyWevy", password: "keys")
leizl = User.create(name: "Leizl", password: "lol")

#this is the seed group of game types right now only coin toss is operating because there is no evocation in my code
#there's also no prompt via the run.rb file for the user to choose any of these games
coin_toss = GameType.create(name:"coin toss")
dungeon = GameType.create(name:"dungeon")
dance = GameType.create(name:"dance")
pingpong = GameType.create(name:"ping pong")

#this is a seed group of results for each id; the individual grouping represents all the gameplay instances for each user
Result.create(user_id: jack.id,game_type_id: coin_toss.id,won: true)
Result.create(user_id: jack.id,game_type_id: coin_toss.id,won: true)
Result.create(user_id: jack.id,game_type_id: coin_toss.id,won: true)
Result.create(user_id: jack.id,game_type_id: coin_toss.id,won: false)

Result.create(user_id: jj.id,game_type_id: dungeon.id,won: true)
Result.create(user_id: jj.id,game_type_id: dungeon.id,won: true)
Result.create(user_id: jj.id,game_type_id: dungeon.id,won: false)
Result.create(user_id: jj.id,game_type_id: dungeon.id,won: false)

Result.create(user_id: james.id,game_type_id: dance.id,won: true)
Result.create(user_id: james.id,game_type_id: dance.id,won: true)

Result.create(user_id: jane.id,game_type_id: coin_toss.id,won: false)
Result.create(user_id: jane.id,game_type_id: coin_toss.id,won: false)
#output explaining that SQLite3 has been seeded

Result.create(user_id: rei.id,game_type_id: coin_toss.id,won: true)
Result.create(user_id: rei.id,game_type_id: dungeon.id,won: true)
Result.create(user_id: rei.id,game_type_id: dance.id,won: true)
Result.create(user_id: rei.id,game_type_id: pingpong.id,won: true)

puts "It has been seeded."

