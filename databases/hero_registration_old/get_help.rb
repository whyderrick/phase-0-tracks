require 'faker'
require 'sqlite3'

db = SQLite3::Database.new("hero_registration.db")

# CONSTANT. Abriged version of my seed dataset. Typically runs
KNOWN_HEROES = {
    "Spiderman" => {
      real_name: "Peter Parker",
      city: "New York City",
      state: "NY",
      team_affiliation: ["Avengers","Amazing Friends", "Confederacy of Dunces", "Defenders"]
    },
    "Iron Man" => {
      real_name: "Tony Stark",
      city: "New York City",
      state: "NY",
      team_affiliation: ["Avengers", "S.H.I.E.L.D."]
    }
  }


# These tables are single use variables and I don't like that it's here.
create_known_table = <<-SQL
  CREATE TABLE IF NOT EXISTS known_supers (
    id INTEGER PRIMARY KEY,
    alias VARCHAR(255),
    name VARCHAR(255),
    address VARCHAR(1023),
    team_affiliation VARCHAR(1023),
    investigator_id INTEGER FOREIGN_KEY REFERENCES investigators(id)
    );
SQL

db.execute(create_known_table)

# create a table for each of the create commands.
# create_commands.each { |command| db.execute(command)}

# iterate over the KNOWN_HEROES constant and add a new row for each in the known_supers table.

# Create a method
def create_address
  "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip}"
end

def create_known(db, name, hero_alias, address, team_affiliation)
  db.execute("INSERT INTO known_supers (name, alias, address, team_affiliation) VALUES (?, ?, ?, ?)",name, hero_alias, address, team_affiliation)
end


def populate_known(db, source)
  source.each do |hero, info|
    hero_alias = hero
    name = info[:real_name]
    address = create_address()
    team_affiliation = info[:team_affiliation].join(", ")

    #puts statement to show that iterating and assigning variables works.
    puts " hero_alias is #{hero_alias}
    name is #{name}
    address is #{address}
    team_affiliation is #{team_affiliation}"
    # The next line is commented out to start because it's where things break down. It combine the iterated values of this method with a call to create_known, but throws many many errors.
    db.execute(create_known(db, name, hero_alias, address, team_affiliation))
  end
end

#insert Mr Fantastic and pull records to show that create_known works at the individual level
create_known(db, "Reed Richards", "Mr. Fantastic", create_address, ["many"])

rows = db.execute('SELECT id, alias, name, address FROM known_supers WHERE alias IS "Mr. Fantastic"')
p rows

populate_known(db, KNOWN_HEROES)
# # iterate through the dataset. This is the problem section. If we come
# KNOWN_HEROES.each do |hero, info|
#   statement = <<-SQL
#     INSERT INTO known_supers (name, alias, address, team_affiliation) VALUES (?,?,?,?)
#   SQL
#   db.execute(statement, [hero, info[:real_name], create_address(),info[:team_affiliation]])
# end