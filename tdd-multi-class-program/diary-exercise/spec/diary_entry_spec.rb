require "diary_entry"

describe DiaryEntry do
  it "constructs" do
    entry = DiaryEntry.new("title_1", "contents_1")
    expect(entry.title).to eq "title_1"
    expect(entry.contents).to eq "contents_1"
  end

  describe "#count_words" do
    it "returns zero if contents is empty" do
      entry = DiaryEntry.new("title_1", "")
      expect(entry.count_words).to eq 0
    end

    it "returns one if contents is one word" do
      entry = DiaryEntry.new("title_1", "one")
      expect(entry.count_words).to eq 1
    end

    it "returns a word count of contents" do
      entry = DiaryEntry.new("title_1", "one, two, three")
      expect(entry.count_words).to eq 3
    end
  end

  describe "#reading_time" do
    it "fails if the wpm is zero" do
      entry = DiaryEntry.new("title_1", "contents_1")
      expect { entry.reading_time(0) }.to raise_error "WPM must be positive."
    end

    it "returns zero if contents is empty" do
      entry = DiaryEntry.new("title_1", "")
      expect(entry.reading_time(2)).to eq 0
    end

    it "returns one if contents has one word" do
      entry = DiaryEntry.new("title_1", "one")
      expect(entry.reading_time(2)).to eq 1
    end

    it "returns the reading time in minutes for the contents" do
      entry = DiaryEntry.new("title_1", "one, apple, two, banana, three")
      expect(entry.reading_time(2)).to eq 3
    end
  end

  describe "#reading_chunk" do
    context "with a text that is readable within the given minutes" do
      it "returns all the words" do
        entry_1 = DiaryEntry.new("title_1", "red, blue")
        entry_2 = DiaryEntry.new("title_2", "orange, apple, banana, pear")
        expect(entry_1.reading_chunk(2, 1)).to eq "red, blue"
        expect(entry_2.reading_chunk(4, 1)).to eq "orange, apple, banana, pear"
      end
    end

    context "with a text that is not readable within the given minutes" do
      it "returns a chunk of the text that can be read" do
        entry_1 = DiaryEntry.new("title_1", "red, blue")
        entry_2 = DiaryEntry.new("title_2", "orange, apple, banana, pear")
        expect(entry_1.reading_chunk(1, 1)).to eq "red,"
        expect(entry_2.reading_chunk(2, 1)).to eq "orange, apple,"
      end

      it "returns the next chunk when called again" do
        entry_1 = DiaryEntry.new("title_1", "red, blue")
        entry_2 = DiaryEntry.new("title_2", "orange, apple, banana, pear")
        entry_1.reading_chunk(1, 1)
        entry_2.reading_chunk(2, 1)
        expect(entry_1.reading_chunk(1, 1)).to eq "blue"
        expect(entry_2.reading_chunk(2, 1)).to eq "banana, pear"
      end

      it "starts from the beginning after contents are fully read" do
        entry_1 = DiaryEntry.new("title_1", "orange, apple, banana, pear, strawberry")
        entry_1.reading_chunk(2, 1)
        entry_1.reading_chunk(4, 1)
        expect(entry_1.reading_chunk(2, 1)).to eq "orange, apple,"
      end

      it "starts from the beginning if finishing exactly on the end" do
        entry_1 = DiaryEntry.new("title_1", "orange, apple, banana, pear, strawberry")
        entry_1.reading_chunk(2, 1)
        entry_1.reading_chunk(2, 1)
        expect(entry_1.reading_chunk(1, 1)).to eq "strawberry"
      end
    end
  end
end
