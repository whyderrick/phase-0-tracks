# Set external dependencies (if that's the right term for this)
require 'SQLite3'
require 'faker'
require 'bcrypt'
require_relative 'states'

# initialize a database
db = SQLite3::Database.new('hero_reports.db')

# build create table statements
create_reports_table = <<-SQL
  CREATE TABLE IF NOT EXISTS reports (
    id INTEGER PRIMARY KEY,
    reporter_name VARCHAR(255),
    reporter_state VARCHAR(255),
    reporter_phone VARCHAR(255),
    hero_seen VARCHAR(255),

    powers_displayed VARCHAR(255),
    investigator_id INTEGER FOREIGN_KEY REFERENCES investigators(id)
    );
SQL

create_investigator_table = <<-SQL
    CREATE TABLE IF NOT EXISTS investigators (
      id INTEGER PRIMARY KEY,
      name VARCHAR(255),
      jurisdiciton VARCHAR(255),
      username VARCHAR(255),
      password VARCHAR(255)
      );
SQL

# Recreate reports table with field for suspect_name
modify_investigator_table = [
  "ALTER TABLE reports RENAME TO tempOldTable;",
  "CREATE TABLE reports(
    id INTEGER PRIMARY KEY,
    reporter_name VARCHAR(255),
    reporter_state VARCHAR(255),
    reporter_phone VARCHAR(255),
    hero_seen VARCHAR(255),
    suspect_name VARCHAR(255),
    powers_displayed VARCHAR(255),
    investigator_id INTEGER FOREIGN_KEY REFERENCES investigators(id)
    );"
]

modify_investigator_table.each do |statement|
  db.execute(statement)
end

create_commands = [create_reports_table, create_investigator_table]
create_commands.each {|command| db.execute(command)}

def insert_investigator(database)
  name = Faker::Name.name
  username = Faker::Internet.user_name
  # password should be run through bcrypt, but we'll learn more about password management with Sinatra and I'm running behind.
  password = Faker::Internet.password(8,18)
  cmd = "INSERT INTO investigators (name, username,  password) VALUES (?,?,?)"
  database.execute(cmd, [name, username, password])
end

# STATES.each do |state|
#   sql_cmd = <<-SQL
#     INSERT INTO investigators (name, jurisdiction, username, password) VALUES (?,?,?,?)
#   SQL
#   db.execute(sql_cmd, [Faker::Name.name, Faker::Internet.user_name, Faker::Internet.password(8, 18)])
# end
#53.times {insert_investigator(db)}


# winning insert!
STATES.each do |sub_array|
  state_name = sub_array[1]
  investigator_name = Faker::Name.name
  investigator_user_name = Faker::Internet.user_name
  investigator_password = Faker::Internet.password

  db.execute("INSERT INTO investigators (name, jurisdiciton, username, password) VALUES (?,?,?,?)", [investigator_name, state_name, investigator_user_name, investigator_password])
end

=begin
 Populate the reports table
=end
def report_powers(database)
  reporter_name = Faker::Name.name
  reporter_state = Faker::Address.state
  reporter_phone = Faker::PhoneNumber.phone_number
  hero_seen = Faker::Superhero.name
  powers_displayed = Faker::Superhero.power

  sql = ("INSERT INTO reports (reporter_name,reporter_state, reporter_phone, hero_seen, powers_displayed) VALUES (?,?,?,?,?)")
  database.execute(sql, [reporter_name, reporter_state, reporter_phone, hero_seen, powers_displayed])
end

# Seed the reports table
=begin
1500.times do
  report_powers(db)
end
=end

# Write a method to count entries in the database
def count_entries(database, name)
  sql = <<-SQL
    SELECT hero_seen, COUNT(*) c FROM reports WHERE hero_seen = ? GROUP BY hero_seen HAVING c > 1
  SQL
  p database.execute(sql, name)
end

count_entries(db, "Gambit")