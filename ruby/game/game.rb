class Game
  attr_reader :word
  attr_accessor :guess_word, :guesses_left, :guess_array
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
      p response
      response
    else
      @guesses_left -= 1
      @guess_array << letter
      word.each_char do |char|
        @guess_word[word.index(char)] = char if word[char] == letter
        p char, guess_word
      end
      @guess_word
    end
  end

end

game = Game.new("dragoon")
game.make_guess("o")
game.make_guess("o")