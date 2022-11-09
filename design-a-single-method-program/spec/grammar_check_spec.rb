require "grammar_check"

describe "grammar_check method" do
  context "passed an empty string" do
    it "fails" do
      expect { grammar_check("") }.to raise_error "Invalid sentence."
    end
  end

  context "passed a sentence with a capital letter and full stop" do
    it "returns true" do
      result = grammar_check("Hello, I am David.")
      expect(result).to eq true
    end
  end

  context "passed a sentence without a capital letter" do
    it "returns false" do
      result = grammar_check("hello, I am David.")
      expect(result).to eq false
    end
  end

  context "passed a sentence without a full stop" do
    it "returns false" do
      result = grammar_check("Hello, I am David")
      expect(result).to eq false
    end
  end

  context "passed a sentence with neither a full stop nor a capital" do
    it "returns false" do
      result = grammar_check("hello, I am David")
      expect(result).to eq false
    end
  end

  context "passed a sentence with an uppercase first word" do
    it "returns true" do
      result = grammar_check("HELLO, I am David.")
      expect(result).to eq true
    end
  end

  context "passed a valid sentence ending with an exclaimation mark" do
    it "returns true" do
      result = grammar_check("Hello, I am David!")
      expect(result).to eq true
    end
  end

  context "passed a valid sentence ending with an question mark" do
    it "returns true" do
      result = grammar_check("Hello, I am David?")
      expect(result).to eq true
    end
  end

  context "passed a sentence ending with a comma" do
    it "returns false" do
      result = grammar_check("Hello, I am David,")
      expect(result).to eq false
    end
  end
end
