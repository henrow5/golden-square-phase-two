class MusicList
  def initialize
    @list = []
  end

  def add(track)
    fail "Track already on the list." if @list.include?(track)
    @list << track
  end

  def list
    @list
  end
end
