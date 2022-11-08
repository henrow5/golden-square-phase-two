def make_snippet(string)
  words = string.split(" ")
  if words.length > 5
    "#{words[0]} #{words[1]} #{words[2]} #{words[3]} #{words[4]}..."
  else
    string
  end
end
