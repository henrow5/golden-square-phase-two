class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @last_index = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm)
    fail "Invalid reading speed." if wpm <= 0
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    readable_words = wpm * minutes
    start_index = @last_index
    end_index = @last_index + readable_words
    words = @contents.split(" ")
    end_index >= count_words ? @last_index = 0 : @last_index = end_index
    words[start_index, end_index].join(" ")
  end
end
