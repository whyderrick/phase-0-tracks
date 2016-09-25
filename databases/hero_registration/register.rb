# require gems
require 'faker'
require 'sqlite3'

# create SQLite3 database
db = SQLite3::Database.new("known_heroes.db")