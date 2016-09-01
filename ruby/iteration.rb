=begin
def yieldSample
  puts "This code is running. It has not executed a block"
  yield("Brian", "Derrick")
  yield( "Eric", "Jessica")
  yield( "Nyla")
  puts "The code above was executed by a block"

end

yieldSample {|a, b| puts "Name's are #{a} and #{b}"}
=end

array = ["french fries", "McChicken", "Big Mac", "soda", "sundae", "parfait", "nuggets"]

jordan_stats = {
  :points_per_game => 31.3 ,
  :rebounds_per_game => 8.6,
  assists_per_game: 4.2,
  steals_per_game: 2.4,
  slogan: "I wanna be like Mike!",
  endorsements: ["Gatorade", "Nike", "McDonald's"]
}

array.each{|item| puts "Item is #{item}"}
jordan_stats.each{|k,v| puts "#{k.to_s}: #{v}"}

array.map{|x| puts x[3..-1]}
array
array.map!{|x| puts x[2..-1]}
array