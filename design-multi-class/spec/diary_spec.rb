require "diary"

describe Diary do
  it "initially has an empty list" do
    diary = Diary.new
    expect(diary.list_all).to eq []
  end
end
