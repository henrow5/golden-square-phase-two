def grammar_check(text)
  fail "Invalid sentence." if text.empty?
  first_letter_uppercase = text[0] == text[0].upcase
  valid_last_character = [".", "!", "?"].include?(text[-1])
  first_letter_uppercase && valid_last_character ? true : false
end
