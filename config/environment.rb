#A require file referencing the bundler tracks and installs the exact gems and versions that are needed.
require 'bundler'

#Bundler.require sets up the load paths and automatically requires every dependency,saving you from having to manually require each one.
Bundler.require

#This is the environment setup for ActiveRecord, which says establish a connection using sqlite3, a relational database management system
#SQL = structured query language
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

#This line of code omits the ActiveRecord feedback from the terminal output, by setting it to nil.
ActiveRecord::Base.logger = nil