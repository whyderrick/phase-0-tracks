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
53.times {insert_investigator(db)}