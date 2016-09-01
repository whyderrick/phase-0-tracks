def yieldSample
  puts "This code is running. It has not executed a block"
  yield("Brian", "Derrick")
  yield( "Eric", "Jessica")
  yield( "Nyla")
  puts "The code above was executed by a block"

end

yieldSample {|a, b| puts "Name's are #{a} and #{b}"}

array = ["french fries", "McChicken", "Big Mac", "soda", "sundae", "parfait", "nuggets"]

jordan_stats = {
  :points_per_game => 31.3 ,
  :rebounds_per_game => 8.6,
  assists_per_game: 4.2,
  steals_per_game: 2.4,
  slogan: "I wanna be like Mike!",
  endorsements: ["Gatorade", "Nike", "McDonald's"]
}