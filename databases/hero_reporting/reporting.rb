# Set external dependencies (if that's the right term for this)
require 'SQLite3'
require 'faker'
require 'bcrypt'
require_relative 'states'

# initialize a database
db = SQLite3::Database.new('hero_reports.db')

# build create table statements
create_reports_table = <<-SQL
  CREATE TABLE IF NOT EXISTS reports(
    id INTEGER PRIMARY KEY,
    reporter_name VARCHAR(255),
    reporter_state VARCHAR(255),
    reporter_phone VARCHAR(255),
    hero_seen VARCHAR(255),
    suspect_name VARCHAR(255),
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
def add_report(database, hash)
  sql = "INSERT INTO reports(reporter_name, reporter_state, reporter_phone, hero_seen, suspect_name, powers_displayed) VALUES (?,?,?,?,?,?)"

  database.execute(sql, [ hash["reporter_name"], hash["reporter_state"], hash["reporter_phone"], hash["hero_seen"], hash["suspect_name"], hash["powers_displayed"]])
end

=begin
1500.times do
  seed_hash = {
    "reporter_name" => Faker::Name.name,
    "reporter_state" => Faker::Address.state,
    "reporter_phone" => Faker::PhoneNumber.phone_number,
    "hero_seen" => Faker::Superhero.name,
    "suspect_name" => Faker::Name.name,
    "powers_displayed" => Faker::Superhero.power
}
  add_report(db, seed_hash)
end
=end


def submit_report(database)
  report_data = {}
  puts "What's your name?"
  report_data["reporter_name"] =  gets.chomp
  puts "What state do you live in?"
  report_data["reporter_state"] = gets.chomp
  puts "If an investigator needs to reach you, what phone number should they dial?"
  report_data["reporter_phone"] = gets.chomp
  puts "What's the superhero alias of the person you saw?"
  report_data["hero_seen"] = gets.chomp
  puts "What do you think their secret identity is?"
  report_data["suspect_name"] = gets.chomp
  puts ("What power did you see them use?")
  report_data["powers_displayed"] = gets.chomp

  add_report(database, report_data)
  # This is far too high of an overhead operation. The solution would be to localize the assign_investigator method to operate on an individual row and iterate over the database.
  assign_investigator(database)
  investigator_name = database.execute("SELECT b.name FROM reports a JOIN investigators b ON a.investigator_id = b.id ORDER BY a.id DESC LIMIT 1;")
  investigator_name = investigator_name.to_s.match(/[\w\.\s]+/)
  puts "Your investigator, #{investigator_name}, will be in touch."
end

# Write methods to count entries in the database
def count_all_entries(database)
  sql = <<-SQL
    SELECT hero_seen, COUNT(*) c FROM reports GROUP BY hero_seen HAVING c > 1
  SQL
  p database.execute(sql)
end

def count_super_reports(database, name)
  sql = <<-SQL
    SELECT hero_seen, COUNT(*) c FROM reports WHERE hero_seen = ? GROUP BY hero_seen HAVING c > 1
  SQL
  p database.execute(sql, name)
end

# Write a method to assign investigators to reports
def assign_investigator(database)
  sql = <<-SQL
    UPDATE reports
    SET investigator_id = (SELECT id
                           FROM investigators
                           WHERE jurisdiciton = reports.reporter_state)
  SQL
  database.execute(sql)
end

# rows = db.execute("SELECT * FROM reports")

# rows.each do |row|
#   puts row[0], row[1] if row[0] % 100 == 0
#   sql = <<-SQL
#   UPDATE reports SET investigator_id = 1 WHERE
#   SQL
# end

submit_report(db)
