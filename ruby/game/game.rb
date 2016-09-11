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
    # Repeat guesses doesn't currently work
    # if @guess_array.include? letter
    #   # response = "That's a repeat guess. Try again"
    #   # p response
    #   # return response
    # else
      @guesses_left -= 1
      @guess_array << letter
      puts  "@guess_array is #{@guess_array}"
      idx = 0
      while idx < @word.length do
        char = word[idx]
        @guess_word[idx] = char if char == letter
        p char, guess_word
        idx +=1
        puts "idx is #{idx}"
      end
      response = @guess_word
    # end
    response
  end

end

game = Game.new("dragoon")
game.make_guess("o")