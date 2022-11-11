require "music_list"

describe MusicList do
  context "No tracks added" do
    it "Returns an empty list" do
      tracks = MusicList.new
      expect(tracks.list).to eq []
    end
  end

  context "Adding a track" do
    it "Returns the list with the added track" do
      tracks = MusicList.new
      tracks.add("Never Gonna Give You Up")
      expect(tracks.list).to eq ["Never Gonna Give You Up"]
    end
  end

  context "Adding two tracks" do
    it "Returns the list with the added tracks" do
      tracks = MusicList.new
      tracks.add("Never Gonna Give You Up")
      tracks.add("Together Forever")
      expect(tracks.list).to eq ["Never Gonna Give You Up", "Together Forever"]
    end
  end

  context "Adding a track that is already on the list" do
    it "fails" do
      tracks = MusicList.new
      tracks.add("Never Gonna Give You Up")
      tracks.add("Together Forever")
      expect { tracks.add("Never Gonna Give You Up") }.to raise_error "Track already on the list."
    end
  end
end
