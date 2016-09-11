class Game
  attr_reader :word, :guesses_left
  attr_accessor :guess_word, :guess_array
  #not sure if guess count needs to be accessible outside the class or not

  def initialize(word)
    @word = word
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
    puts "You have #{guesses_left} guesses remaining." unless guesses_left == 0
    puts response
    response
  end
end

puts "Player 1, what's your word?"
word = gets.chomp.downcase
game = Game.new(word)
end_game_message = ""
while game.guesses_left > 0 do
  if game.word == game.guess_word
    end_game_message = "You figured out that the word was #{game.word}! You must've thought really hard about your choices."
    end_game_message
    break
  else
    puts "Player 2, what's your first letter guess?"
    letter = gets.chomp.downcase
    game.make_guess(letter)
  end
end
