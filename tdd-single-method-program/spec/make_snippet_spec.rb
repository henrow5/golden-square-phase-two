require "make_snippet"

describe "make_snippet" do
  it "returns the first five words and ... " do
    expect(make_snippet("Hi, my name is John and I have 3 cars")).to eq "Hi, my name is John..."
  end

  it "returns the string if less than five words" do
    expect(make_snippet("Hi, I'm John")).to eq "Hi, I'm John"
  end
end
