module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words + "!!!" + " <3"
  end
end

class Child
  include Shout
end

class Trainer
  include Shout
end

child = Child.new
p child.yell_happily("I'm in love")
p child.yell_angrily("I want food")
drill_sargeant = Trainer.new
p drill_sargeant.yell_happily("Recruits, you're getting useful")
p drill_sargeant.yell_angrily("My love has left me cuckolded")