# Set external dependencies (if that's the right term for this)
require 'SQLite3'
require 'faker'
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

create_commands = [create_reports_table, create_investigator_table]
create_commands.each {|command| db.execute(command)}

def insert_investigator(database)
  name = Faker::Name.name
  username = Faker::Internet.user_name
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

# STATES.each_with_index do |state, index|
#   state_length = STATES.length
#   state_name = STATES[index][1]
#   p state_length
#   p index
#   # db.execute("UPDATE investigators SET jurisdiction = ? WHERE investigators.id % ? = 0;",[state_name,index])
# end

# winning insert!
STATES.each do |sub_array|
  state_name = sub_array[1]
  investigator_name = Faker::Name.name
  investigator_user_name = Faker::Internet.user_name
  investigator_password = Faker::Internet.password

  db.execute("INSERT INTO investigators (name, jurisdiciton, username, password) VALUES (?,?,?,?)", [investigator_name, state_name, investigator_user_name, investigator_password])
end

STATES.each_with_index do |state, index|
  state_name = state[1]
  db.execute("UPDATE investigators SET jurisdiciton = ? WHERE investigators.id % ? = 0;",[state_name,index])
end


STATES.each do |sub_array|
  states = sub_array[1]
  names = Faker::Name.name
  db.execute("INSERT INTO user2 (name, state) VALUES (?,?)", [names, states])
end

 STATES.each do |sub_array|
    state = sub_array[1]
     db.execute("INSERT INTO users (name) VALUES (?);", state)
   end