require "diary_entry"

describe DiaryEntry do
  it "constructs" do
    entry = DiaryEntry.new("title_1", "contents_1")
    expect(entry.title).to eq "title_1"
    expect(entry.contents).to eq "contents_1"
  end

  describe "#reading_time" do
    it "returns the reading time in minutes of the contents for a given wpm" do
      entry = DiaryEntry.new("title_1", "one two three four five")
      expect(entry.reading_time(2)).to eq 3
    end
  end

  describe "#extract_numbers" do
    it "extracts numbers from contents" do
      entry = DiaryEntry.new("title_1", "call me on 07987123456")
      expect(entry.extract_numbers).to eq ["07987123456"]
    end

    it "returns an empty array with no numbers found" do
      entry = DiaryEntry.new("title_1", "one two three four five")
      expect(entry.extract_numbers).to eq []
    end
  end
end
