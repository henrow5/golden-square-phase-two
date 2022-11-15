require "diary"
require "diary_entry"

describe "Diary Integration" do
  it "returns a list of all entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("title_1", "contents_1")
    entry_2 = DiaryEntry.new("title_2", "contents_2")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.list_all).to eq [entry_1, entry_2]
  end

  it "shows contents of selected entry" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("title_1", "contents_1")
    entry_2 = DiaryEntry.new("title_2", "contents_2")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.show_contents("title_1")).to eq "contents_1"
  end

  it "selects the best readable entry" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("title_1", "red blue green yellow")
    entry_2 = DiaryEntry.new("title_2", "apple orange pear banana grape")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.best_readable_entry(2, 2)).to eq [entry_1]
  end

  it "list extracted numbers from all entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("title_1", "red blue green yellow")
    entry_2 = DiaryEntry.new("title_2", "call me on 07987123456")
    entry_3 = DiaryEntry.new("title_3", "my number is 07987654321")
    diary.add(entry_1)
    diary.add(entry_2)
    diary.add(entry_3)
    expect(diary.list_numbers).to eq ["07987123456", "07987654321"]
  end
end
