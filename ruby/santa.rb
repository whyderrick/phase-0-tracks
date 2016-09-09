class Santa
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

  # Getter methods
  def age
    @age
  end

  def ethnicity
    @ethnicity
  end

  def reindeer_ranking
    @reindeer_ranking
  end


  # Setter methods
  def celebrate_birthday
    @age += 1
    puts @age
  end

  def gender=(new_gender)
    @gender = new_gender
  end

  def get_mad_at(bad_deer)
    reindeer_ranking
    reindeer_ranking.each do |item|
      if item == bad_deer
        reindeer_ranking.push(bad_deer)
        deer_index = reindeer_ranking.index(item)
        reindeer_ranking.delete_at(deer_index)
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
puts santa.reindeer_ranking
santa.celebrate_birthday
santa.get_mad_at("Dasher")
puts santa.reindeer_ranking
