require "diary"
require "diary_entry"

describe "Diary Integration" do
  it "returns a list of added diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("title_1", "contents_1")
    entry_2 = DiaryEntry.new("title_2", "contents_2")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.all).to eq [entry_1, entry_2]
  end

  describe "word counting behaviour" do
    it "returns the number of words in all diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_1", "one, two, three")
      entry_2 = DiaryEntry.new("title_2", "four, five, six")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 6
    end
  end

  describe "reading time behaviour" do
    it "fails where wpm is zero" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_1", "one, two, three")
      diary.add(entry_1)
      expect { diary.reading_time(0) }.to raise_error "WPM must be positive."
    end

    it "returns the reading time in minutes of all entries where it fits exactly" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_1", "one, two, three")
      entry_2 = DiaryEntry.new("title_2", "four, five, six")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(2)).to eq 3
    end

    it "returns the reading time in minutes of all entries where it falls over a minute" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_1", "one, two, three")
      entry_2 = DiaryEntry.new("title_2", "four, five")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(2)).to eq 3
    end
  end

  describe "best reading time entry behavior" do
    it "fails where wpm is 0" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_1", "one, two")
      diary.add(entry_1)
      expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error "WPM must be positive."
    end

    context "one entry and it is readable in the time" do
      it "returns that entry" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("title_1", "one, two")
        diary.add(entry_1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq entry_1
      end
    end

    context "one entry and it is unreadable in the time" do
      it "returns nil" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("title_1", "one, two, three")
        diary.add(entry_1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end

    context "multiple entries" do
      it "returns the longest entry readable in the time" do
        diary = Diary.new
        best_entry = DiaryEntry.new("title_1", "one two")
        diary.add(best_entry)
        diary.add(DiaryEntry.new("title_2", "one"))
        diary.add(DiaryEntry.new("title_3", "one two three"))
        diary.add(DiaryEntry.new("title_4", "one two three four"))
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq best_entry
      end
    end
  end
end
