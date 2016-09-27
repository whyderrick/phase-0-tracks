# require gems
require 'faker'
require 'sqlite3'
# require known_supers
require_relative 'known_supers_data'

# create SQLite3 database
db = SQLite3::Database.new("hero_registration.db")

#  I considered making a method that allows the user to make the want to make a method that makes a wizard for the user to create a new table, but it seems like that's uncommon and once we're using Rails we'll be more likely to use migration through ActiveRecord, so I'm comfortable passing on that idea for now.

# These tables are single use variables and I don't like that it's here.
create_known_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS known_supers (
    id INTEGER PRIMARY KEY,
    alias VARCHAR(255),
    name VARCHAR(255),
    address VARCHAR(1023),
    team_affiliation VARCHAR(1023),
    investigator_id INTEGER FOREIGN_KEY REFERENCES investigators(id)
    );
SQL

create_suspected_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS suspected_supers (
    id INTEGER PRIMARY KEY,
    accuser_name VARCHAR(255),
    alias VARCHAR(255),
    power VARCHAR(255),
    suspect_name VARCHAR(255),
    known_id INTEGER FOREIGN_KEY REFERENCES known_supers(id)
    );
SQL

# I'm thinking it's bad practice to keep user ID/Passwords together with any other database data, but for the sake of efficiency, I'll get this working and follow best practices on the next one.
create_investigator_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS investigators (
    id INTEGER PRIMARY KEY,
    user_name VARCHAR(255),
    password VARCHAR(64),
    name VARCHAR(255),
    bagde INTEGER,
    jurisdiction VARCHAR(255)
    );
SQL

create_leads_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS leads (
    id INTEGER PRIMARY KEY,
    name VARCHAR (255),
    suspected_alias VARCHAR(255),
    address VARCHAR(1000),
    times_accused INTEGER,
    investigator_id INTEGER FOREIGN_KEY REFERENCES investigators(id)
    );
SQL

db.execute(create_known_cmd)
create_commands = [
  create_leads_cmd,
  create_investigator_cmd,
  create_suspected_cmd,
  create_known_cmd
]

# create a table for each of the create commands.
create_commands.each { |command| db.execute(command)}

# iterate over the KNOWN_HEROES constant and add a new row for each in the known_supers table.

# Create a method
def create_address
  "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip}"
end

def create_known(database, name, hero_alias, address)
  statement = database.prepare( "INSERT INTO known_supers (name, alias, address, team_affiliation) VALUES (?,?,?,)")
  database.execute('INSERT INTO known_supers (name, alias, address, team_affiliation) VALUES (?, ?, ?, ?)', [name, hero_alias, address])
end

def populate_known(db, source)
  statement = db
  source.each do |hero, info|
    hero_alias = hero
    name = info[:real_name]
    address = create_address()
    team_affiliation = info[:team_affiliation]
    command =
    # puts " hero_alias is #{hero_alias}
    # name is #{name}
    # address is #{address}
    # team_affiliation is #{team_affiliation}"
   db.execute('INSERT INTO known_supers (name, alias, address, team_affiliation) VALUES (?, ?, ?, ?)', [name, hero_alias, address, team_affiliation])
  end
end


create_known(db, "Peter Parker", "Spiderman", create_address)
populate_known(db, KNOWN_HEROES)


KNOWN_HEROES.each do |hero, info|
  statement = <<-SQL
    INSERT INTO known_supers (name, alias, address, team_affiliation) VALUES (?,?,?,?)
  SQL
  db.execute(statement, [hero, info[:real_name], create_address(),info[:team_affiliation]])
end