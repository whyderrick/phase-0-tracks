module Shout
  #We'll add some methods later.
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words + "!!!" + " <3"
  end
end

p Shout.yell_happily("I'm in love")
p Shout.yell_angrily("My love has left me cuckolded")