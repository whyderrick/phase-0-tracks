# Set external dependencies (if that's the right term for this)
require 'SQLite3'
require 'faker'
require_relative 'states.rb'

# initialize a database
db = SQLite3::Database.new('hero_reports.db')

# build create table statements
create_reports_table = <<-SQL
  CREATE TABLE reports (
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
    CREATE TABLE investigators (
      id INTEGER PRIMARY KEY,
      name VARCHAR(255),
      jurisdiciton VARCHAR(255),
      username VARCHAR(255),
      password VARCHAR(255)
      )
SQL

create_commands = [create_reports_table, create_investigator_table]
create_commands.each {|command| db.execute(command)}