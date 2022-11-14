class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @last_index = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.split.length
    # return 0 if @contents.empty?
    # return @contents.count(" ") + 1
  end

  def reading_time(wpm)
    fail "WPM must be positive." unless wpm.positive?
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    readable_words = wpm * minutes
    start_index = @last_index
    end_index = start_index + readable_words
    if end_index >= count_words
      @last_index = 0
    else
      @last_index = end_index
    end
    words = @contents.split(" ")
    chunk = words[start_index, end_index].join(" ")
    return chunk
  end
end
