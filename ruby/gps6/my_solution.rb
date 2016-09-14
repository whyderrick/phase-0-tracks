# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative lets you treat the current working directory as a given without needing to reference the containing directory itself.
# Conversely, require requires you to use ./ to include a file that's in the same directory as the file where require or require_relative is typed.

require_relative 'state_data'

class VirusPredictor
# This method initializes an instance of the virus predictor class. It currently takes 3 params and assigns them as instance variables.
  def initialize(state_of_origin)
    @state = state_of_origin
    @population = STATE_DATA[state_of_origin][:population]
    @population_density = STATE_DATA[state_of_origin][:population_density]
  end

# Runs methods defined further below passing our existing variables as arguments.
  def virus_effects
    print "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  private

# Takes 3 params. print a statement that calculates number of deaths via outbreak depending on population density.
  def predicted_deaths
    # predicted deaths is solely based on population density

    if @population_density >= 200
      death_rate = 0.4
    elsif @population_density >= 150
      death_rate = 0.3
    elsif @population_density >= 100
      death_rate = 0.2
    elsif @population_density >= 50
      death_rate = 0.1
    else
      death_rate = 0.05
    end

    (@population * death_rate).floor

  end

# Takes 2 parameters. Uses control flow to set a value for speed contingent on population density and prints a statement containing that value for speed.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      0.5
    elsif @population_density >= 150
      1
    elsif @population_density >= 100
      1.5
    elsif @population_density >= 50
      2
    else
      2.5
    end

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each_key { |state_name| VirusPredictor.new(state_name).virus_effects }

# Reflection Section#=======================================================================
