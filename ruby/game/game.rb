class Game
  attr_reader :word, :guesses_left
  attr_accessor :guess_word, :guess_array, :completed_word

  def initialize(word)
    @word = word
    word_length = word.length
    @guesses_left = (word_length/1.8 + 5).floor
    @guess_word = ""
    word_length.times{@guess_word += "-"}
    @guess_array = []
    @completed_word = false
  end

  def make_guess(letter)
    if @guess_array.include? letter
      puts  "That's a repeat guess. Try again"
    else
      @guesses_left -= 1
      @guess_array << letter
      # puts  "So far you've guessed #{@guess_array}"
      idx = 0
      while idx < @word.length do
        char = word[idx]
        @guess_word[idx] = char if char == letter
        idx +=1
      end
      completed_word = true if @guess_word == @word
      response = @guess_word
    end
  end
end

puts "Player 1, what's your word?"
word = gets.chomp.downcase
game = Game.new(word)
while game.guesses_left >= 1 do
  if game.word == game.guess_word
    game.completed_word = true
    break
  elsif game.guesses_left == 1
    puts "Last guess – make it count!"
    letter = gets.chomp.downcase
    game.make_guess(letter)
  else
    puts "So far you've guessed these letters: #{game.guess_array} \n
    The word is currently #{game.guess_word}" if game.guess_array.length >= 1
    puts "Player 2, what letter do you guess?"
    letter = gets.chomp.downcase
    game.make_guess(letter)
    puts "You have #{game.guesses_left} guesses remaining." unless game.completed_word
    # My completed_word state is writing too late to interrupt this puts statement and I don't understand why.
  end
end

if game.completed_word
  puts "You figured out that the word was \"#{game.word}\"! You must've thought really hard about your choices."
else
  puts "Not your best work Sherlock..."
end