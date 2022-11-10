def todo_check(text)
  fail "Invalid to-do" if text.empty?
  text.include?("#TODO") || false
end
