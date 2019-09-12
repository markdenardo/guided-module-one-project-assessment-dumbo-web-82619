PRESENTATION FLOW
COIN_TOSS, or how I designed a project too complicated and ambitious for mod_1. :)

I wanted to make a game because of personal/profesional/education experience in game design. 
I thought the concepts of User Stories, OOP, Domain Modeling, Ruby, and ActiveRecord would be relatable, 
through the process of Game Design, something I understand.
This was a gamble, and it paid off because I had great teachers, and remained very scrappy in the process.

APPLICATION DEMONSTRATION

DOMAIN MODELING
emphasis on joiner model and why it works so well
specifically the write method of the user data

COIN TOSS: User Stories and demostration of CRUD

CREATE 
A user can enter a new user account and password, through gets.chomp and save it to SQLite3 through an ActiveRecord method set up in the Stats join model/class.

A nice feature I got to work was a new user could not create an existing account.
(show and explain) IMPORTANT!!!


(Explain how that works, and show the mirror of how the arguments work. show the model, the code in the joiner model and the seed data)

READ
After playing one game of coin toss, a user can check their individual stats.
(Explain the Enumerable methods here. This one is very important Explain the joiner model and how the data works.)

UPDATE
The user’s win/lose results are created as and instance and updated to SQL through ActiveRecord in the run file(referencing the joiner model) 
After playing through a game, this is reflected when a User looks at their stats.

DESTROY
The user can delete their username; and while the data persists in the database at this point it has no User to reference the user_id so it essentially does not exist because it cannot be referenced. 

WHATS NEXT???
refactoring using TTY prompt and more OOP
turn class methods into instance methods (show)
making the game loop
adding 2 more games (dungeon and dance)
working more testing tight feedback loops in pry
completing as many of the unfinished labs for Ruby, OOP, and ActiveRecord as possible from mod1 before mod2 starts
reviewing labs I completed, and re-watching all the videos from mod1

TAKEAWAY
I need to code more to get better at this
I need to make simpler projects and make sure I understand the scope of a project before proceeding to design
(to stay on target with the rubric and learn the most for any given mod exercise)
I am grateful for the assistance, and am glad i was able to ask for help.

Rei, Leizel, Kevin(mod5), Beto(mod3), all of Enumerati (esp. Karina, James, and Benny), and Michelle!!!

Class Method turned into an instance method:
    
    def stats  
            # user = User.find_by(name: name)
 
            array = self.results.map do |result|
            #game, #of plays, #of wins
            result.won
            end
            
            array2 = array.select do |won|
            won == 1
            end
        
        # add all of my results wins and losses together 
        puts "#{array.count} wins"
        
    end

