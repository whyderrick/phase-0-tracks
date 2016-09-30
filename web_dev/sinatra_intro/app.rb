# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET route that retrieves
# students whose ages are above a particular number
get '/students/ages/:min_age' do
  students = db. execute("SELECT * FROM students WHERE age >= ?", params[:min_age])
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
    response << "*" * 15 + "<br>"
  end
  response
end

# write a GET route that retrieves
# an address
get '/contact' do
  <<-http_response
  1004 36th St.<br>
  Berkeley, WI 05742
  http_response
end

# write a GET route that retrieves
# a string with the name of person
# passed through a query parameter
get '/great_job' do
  name = params[:name]
  if name
    "Good job, #{name}!"
  else
    "Good job ol chap!"
  end
end

# write a GET route that takes two numbers
# as route parameters and returns their sum

get '/:param1/plus/:param2' do
  param1 = params[:param1].to_i
  p param1
  param2 = params[:param2].to_i
  p param2
  sum = param1 + param2
  p sum
  "#{sum.to_s}"
end