require "count_words"

describe "count_words method" do
  it "returns the number of words in a given string" do
    expect(count_words("My name is John")).to eq 4
  end
end
