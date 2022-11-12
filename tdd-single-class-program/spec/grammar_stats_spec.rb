require "grammar_stats"

describe GrammarStats do
  describe "#check" do
    context "sentence begins with a capital letter and ends with a sentence-ending punctuation mark" do
      it "returns true" do
        stats = GrammarStats.new
        expect(stats.check("Hello, Baldrick!")).to eq true
      end
    end

    context "a sentence that does not start with a capital letter and/or does not end with a sentence-ending punctuation mark" do
      it "returns false" do
        stats = GrammarStats.new
        expect(stats.check("hello, Baldrick!")).to eq false
      end

      it "returns false" do
        stats = GrammarStats.new
        expect(stats.check("Hello, Baldrick")).to eq false
      end

      it "returns false" do
        stats = GrammarStats.new
        expect(stats.check("hello, Baldrick")).to eq false
      end
    end

    context "when passed an empty string" do
      it "fails" do
        stats = GrammarStats.new
        expect { stats.check("") }.to raise_error "Invalid sentence."
      end
    end
  end

  describe "#percentage_good" do
    context "returns an integer representing a percentage of texts checked so far that passed" do
      it "returns 75" do
        stats = GrammarStats.new
        stats.check("Hello, Baldrick!")
        stats.check("Hello!")
        stats.check("Baldrick!")
        stats.check("hello, Baldrick")
        expect(stats.percentage_good).to eq 75
      end
    end
  end
end
