User.destroy_all
GameType.destroy_all
Result.destroy_all

jack = User.create(name: "Jack",password:"jackfruit")     
jane = User.create(name: "Jane",password: "janefruit")     
james = User.create(name: "James",password:"jamesfruit")   
jj = User.create(name: "JJ",password: "JJfruit")      
  
coin_toss = GameType.create(name:"coin toss")
dungeon = GameType.create(name:"dungeon")
dance = GameType.create(name:"dance")

Result.create(user_id: jack.id,game_type_id: coin_toss.id,won: true)
Result.create(user_id: jj.id,game_type_id: dungeon.id,won: false)
Result.create(user_id: james.id,game_type_id: dance.id,won: true)
Result.create(user_id: jane.id,game_type_id: coin_toss.id,won: false)

puts "It has been seeded."

