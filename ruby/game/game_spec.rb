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
    #empty
  end

  it "doesn't penalize repeat guesses" do
    @guess_array = ["a", "b", "c"]
    expect(game.make_guess("a")).to eq "That's a repeat guess. Try again"

  end

  it "Updates the number of guesses" do
    #empty
  end

  it "Updates hyphen string " do
    expect(game.make_guess("o")).to eq "----oo-"
  end
end