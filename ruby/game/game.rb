class Game
  attr_reader :word, :guesses_left
  attr_accessor :guess_word, :guess_array
  #not sure if guess count needs to be accessible outside the class or not

  def initialize(word)
    @word = word.downcase
    word_length = word.length
    @guesses_left = word_length/2 + 5
    @guess_word = ""
    word_length.times{@guess_word += "-"}
    @guess_array = []
  end

  def make_guess(letter)
    if @guess_array.include? letter
      response = "That's a repeat guess. Try again"
      return response
    else
      @guesses_left -= 1
      @guess_array << letter
      puts  "So far you've guessed #{@guess_array}"
      idx = 0
      while idx < @word.length do
        char = word[idx]
        @guess_word[idx] = char if char == letter
        idx +=1
      end
      response = @guess_word
    end
    puts "You have #{guesses_left} guesses remaining."
    puts response
    response
  end

end

game = Game.new("dragoon")
game.make_guess("o")
p '-' * 10
game.make_guess("o")
p '-' * 10
game.make_guess("a")
p '-' * 10
game.make_guess("d")
p '-' * 10
game.make_guess("x")
p '-' * 10
game.make_guess("n")
p '-' * 10
game.make_guess("n")
p '-' * 10
game.make_guess("r")
p '-' * 10
game.make_guess("z")
p '-' * 10
game.make_guess("c")
p '-' * 10
game.make_guess("g")