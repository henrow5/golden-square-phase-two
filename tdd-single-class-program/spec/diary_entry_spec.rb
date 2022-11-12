require "diary_entry"

describe DiaryEntry do
  it "creates" do
    entry = DiaryEntry.new("title_one", "contents_one")
    expect(entry.title).to eq "title_one"
    expect(entry.contents).to eq "contents_one"
  end

  describe "#count_words" do
    it "returns a word count of @contents" do
      entry = DiaryEntry.new("title_one", "a few things")
      expect(entry.count_words).to eq 3
    end

    it "returns 0 if @contents is empty" do
      entry = DiaryEntry.new("title_one", "")
      expect(entry.count_words).to eq 0
    end
  end

  describe "#reading_time" do
    context "with 200 wpm" do
      it "returns the minutes rounded up to read the contents" do
        entry = DiaryEntry.new("title_one", "one " * 400)
        expect(entry.reading_time(200)).to eq 2
      end
    end

    context "with 0 wpm" do
      it "fails" do
        entry = DiaryEntry.new("title_one", "a few things")
        expect { entry.reading_time(0) }.to raise_error "Invalid reading speed."
      end
    end
  end

  describe "#reading_chunk" do
    context "with a text that has enough given minutes to be read" do
      it "returns all the words" do
        entry = DiaryEntry.new("title_one", "a few things")
        expect(entry.reading_chunk(200, 1)).to eq "a few things"
      end
    end

    context "with a text that has not enough given minutes to be read" do
      it "returns a chunk of the text that can be read" do
        entry = DiaryEntry.new("title_one", "a few things")
        expect(entry.reading_chunk(2, 1)).to eq "a few"
      end

      it "returns the next chunk with each subsequent call" do
        entry = DiaryEntry.new("title_one", "a few things")
        entry.reading_chunk(2, 1)
        expect(entry.reading_chunk(2, 1)).to eq "things"
      end

      it "returns to the first chunk" do
        entry = DiaryEntry.new("title_one", "a few things")
        entry.reading_chunk(2, 1)
        entry.reading_chunk(2, 1)
        expect(entry.reading_chunk(2, 1)).to eq "a few"
      end

      it "returns to the first chunk if ending exactly on the last word" do
        entry = DiaryEntry.new("title_one", "a few things")
        entry.reading_chunk(2, 1)
        entry.reading_chunk(1, 1)
        expect(entry.reading_chunk(2, 1)).to eq "a few"
      end
    end
  end
end
