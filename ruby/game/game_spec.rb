require_relative 'game'

describe Game do
  let(:game) {Game.new("dragoon")}
  # This might be too basic to test
  it "Takes a word as input" do
    expect(game.word).to eq "dragoon"
  end

  it "Allows for a number of guesses that is a function of word length" do
    expect(game.guesses_left).to eq 8
  end

  it "Creates an empty string of hyphens that matches the word length" do
    expect(game.guess_word.length).to eq game.word.length
  end

  it "Adds previous guesses to an array" do
    game.make_guess("b")
    expect(game.guess_array.include? "b").to be true
  end

  it "doesn't penalize repeat guesses" do
    game.make_guess("a")
    counter = game.guesses_left
    p counter
    game.make_guess("a")
    expect(game.guesses_left).to eq counter
  end

  it "Updates the number of guesses" do
    game.make_guess("x")
    expect(game.guesses_left).to eq 7
  end

  it "Updates hyphen string " do
    expect(game.make_guess("o")).to eq "----oo-"
  end
end