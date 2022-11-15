class DiaryEntry
  def initialize(title, contents) # title and contents are strings
    @title = title
    @contents = contents
  end

  def title
    # Returns the title
    return @title
  end

  def contents
    # Returns the contents
    return @contents
  end

  def reading_time(wpm)
    # Returns the reading time in minutes of the contents for a given wpm
    (@contents.split.length / wpm.to_f).ceil
  end

  def extract_numbers
    # Extracts phone numbers from contents
    @contents.scan(/\d{11}/)
  end
end
