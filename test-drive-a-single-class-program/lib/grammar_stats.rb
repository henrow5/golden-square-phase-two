class GrammarStats
  def initialize
    @count = 0
    @passed = 0
  end

  def check(text) # text is a string
    fail "Invalid sentence." if text.empty?
    first_letter_uppercase = text[0] == text[0].upcase
    valid_last_punctuation = [".", "!", "?"].include?(text[-1])

    @count += 1
    if first_letter_uppercase && valid_last_punctuation
      @passed += 1
      true
    else
      false
    end
  end

  def percentage_good
    ((@passed.to_f / @count.to_f) * 100).to_i
  end
end
