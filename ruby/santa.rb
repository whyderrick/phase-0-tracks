class Santa
  attr_reader :gender, :ethnicity
  attr_accessor :age, :gender, :reindeer_ranking
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance. This Santa is named #{gender}..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  # Setter methods
  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(bad_deer)
    reindeer_ranking
    reindeer_ranking.each do |item|
      if item == bad_deer
        reindeer_ranking.delete(item)
        reindeer_ranking.push(item)
      else
        item
      end
    end
    reindeer_ranking
  end
end

# Driver code
santas = []
santa = Santa.new("black", "male")
# sample_ethnicities = ["white", "black", "Latino", "American Indian", "Pacific Islander", "South Asian", "East Asian", "West African", "East African", "ashamed"]
# sample_names = ["MAERON", "MAERYN","MAGGIE" ,"MAHALA", "MAHALIA", "MAHARI","MAJ","MAJOR","MAKAILA","MALACHI","MARISOL","MAURA","MAUREEN","MAURICE", "MAVERICK"]
# sample_genders = ["agender", "androgyne", "bigender", "butch", "demiboy", "demigender", "femme", "genderfluid", "genderqueer","intergender","nonbinary","male", "female"]
# 10.times do
#   santas << Santa.new(sample_ethnicities.sample, sample_genders.sample)
santa.reindeer_ranking
santa.celebrate_birthday
santa.get_mad_at("Dasher")


