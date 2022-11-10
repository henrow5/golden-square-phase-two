require "todo_check"

describe "todo_check" do
  context "when passed an empty string" do
    it "fails" do
      expect { todo_check("") }.to raise_error "Invalid to-do"
    end
  end

  context "when passed a text without a #TODO" do
    it "returns false" do
      result = todo_check("Go shopping")
      expect(result).to eq false
    end
  end

  context "when passed a text with a lower case #TODO" do
    it "returns false" do
      result = todo_check("#todo Go shopping")
      expect(result).to eq false
    end
  end

  context "when passed a text beginning with a #TODO" do
    it "returns true" do
      result = todo_check("#TODO Go shopping")
      expect(result).to eq true
    end
  end

  context "when passed a text ending with a #TODO" do
    it "returns true" do
      result = todo_check("Go shopping #TODO")
      expect(result).to eq true
    end
  end
end
