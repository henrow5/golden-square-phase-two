class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all
    return @entries
  end

  def count_words
    @entries.reduce(0) { |count, entry| count + entry.count_words }
    # return @entries.sum(&:count_words)
  end

  def reading_time(wpm)
    fail "WPM must be positive." unless wpm.positive?
    (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    readable_entries = @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
    sorted_by_length = readable_entries.sort_by do |entry|
      entry.count_words
    end
    return sorted_by_length.last
    # return readable_entries(wpm, minutes).max_by(&:count_words)
  end

  # private

  # def readable_entries(wpm, minutes)
  #   return @entries.filter do |entry|
  #            entry.reading_time(wpm) <= minutes
  #          end
  # end
end
