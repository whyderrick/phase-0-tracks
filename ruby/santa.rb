class Santa
  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end
  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end
end

# Driver code
santas = []
sample_names = ["MAERON", "MAERYN","MAGGIE" ,"MAHALA", "MAHALIA", "MAHARI","MAJ","MAJOR","MAKAILA","MALACHI","MARISOL","MAURA","MAUREEN","MAURICE", "MAVERICK"]
sample_genders = ["agender", "androgyne", "bigender", "butch", "demiboy", "demigender", "femme", "genderfluid", "genderqueer","intergender","nonbinary","male", "female"]
10.times do
  santas << Santa.new(sample_names.sample, sample_genders.sample)
end