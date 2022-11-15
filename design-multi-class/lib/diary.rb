class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry: instance of DiaryEntry
    # Entry is added to the diary
    # Returns nothing
    @entries << entry
  end

  def list_all
    # Returns a list of entries
    return @entries
  end

  def show_contents(title) # title: string
    # Returns the contents of the selected entry
    @entries.each do |entry|
      return entry.contents if entry.title == title
    end
  end

  def best_readable_entry(wpm, minutes) # wpm: words per minute integer, minutes: minutes integer
    # Returns a list of readable entries based on the given reading speed(wpm) and minutes
    @entries.filter do |entry| entry.reading_time(wpm) <= minutes end
  end

  def list_numbers
    # Returns a list of extracted numbers from all entries
    @entries.map do |entry|
      entry.extract_numbers
    end.flatten
  end
end
