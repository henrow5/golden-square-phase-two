# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

    As a user
    So that I can record my experiences
    I want to keep a regular diary

    As a user
    So that I can reflect on my experiences
    I want to read my past diary entries

    As a user
    So that I can reflect on my experiences in my busy day
    I want to select diary entries to read based on how much time I have and my reading speed

    As a user
    So that I can keep track of my tasks
    I want to keep a todo list along with my diary

    As a user
    So that I can keep track of my contacts
    I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

```ruby
class Diary
  def initialize
  # ..
  end

  def add(entry) # entry: instance of DiaryEntry
    # Entry is added to the diary
    # Returns nothing
  end

  def list_all
    # Returns a list of entries
  end

  def show_contents(title) # title: string
    # Returns the contents of the selected entry
  end

  def best_readable_entry(wpm, minutes) # wpm: words per minute integer, minutes: minutes integer
    # Returns a list of readable entries based on the given reading speed(wpm) and minutes
  end

  def list_numbers
    # Returns a list of extracted numbers from all entries
  end
end

class DiaryEntry
  def initialize(title, contents) # title and contents are strings
  end

  def title
    # Returns the title
  end

  def contents
    # Returns the contents
  end

  def reading_time(wpm)
    # Returns the reading time in minutes of the contents for a given wpm
  end

  def extract_numbers
    # Extracts phone numbers from contents
  end
end

class TodoList
  def initialize
  #
  end

  def add(todo) # todo: instance of Todo
    # Returns nothing
  end

  def incomplete
    # Returns all incomplete to-dos
  end

  def complete
    # Returns all complete to-dos
  end

  def give_up
    # Marks all to-dos as complete
  end
end

class Todo
  def initialize(task) # task: string
  #
  end

  def task
    # Returns the task as a string
  end

  def mark_done
    # Marks the to-do as done
    # Returns nothing
  end

  def done?
    # Returns true if task is done
    # Otherwise, false
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# Diary and DiaryEntry

# 1. Lists all entries
diary = Diary.new
entry_1 = DiaryEntry.new("title_1", "contents_1")
entry_2 = DiaryEntry.new("title_2", "contents_2")
diary.add(entry_1)
diary.add(entry_2)
diary.list_all # => [entry_1, entry_2]

# 2. Show contents of selected entry
diary = Diary.new
entry_1 = DiaryEntry.new("title_1", "contents_1")
entry_2 = DiaryEntry.new("title_2", "contents_2")
diary.add(entry_1)
diary.add(entry_2)
diary.show_contents("title_1") # => "contents_1"

# 3. Selects the best readable entry
diary = Diary.new
entry_1 = DiaryEntry.new("title_1", "red blue green yellow")
entry_2 = DiaryEntry.new("title_2", "apple orange pear banana grape")
diary.add(entry_1)
diary.add(entry_2)
diary.best_readable_entry(2, 2) # => [entry_1]

# 4. list extracted numbers from all entries
diary = Diary.new
entry_1 = DiaryEntry.new("title_1", "red blue green yellow")
entry_2 = DiaryEntry.new("title_2", "call me on 07987123456")
entry_3 = DiaryEntry.new("title_3", "my number is 07987654321")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.list_numbers # => ["07987123456", "07987654321"]

# TodoList and Todo

# 1. List incomplete to-dos
list = TodoList.new
todo_1 = Todo.new("go shopping")
todo_2 = Todo.new("wash clothes")
list.add(todo_1)
list.add(todo_2)
todo_1.mark_done
list.incomplete # => [todo_2]

# 2. List complete to-dos
list = TodoList.new
todo_1 = Todo.new("go shopping")
todo_2 = Todo.new("wash clothes")
list.add(todo_1)
list.add(todo_2)
todo_1.mark_done
list.complete # => [todo_1]

# 3. Mark all to-dos as done
list = TodoList.new
todo_1 = Todo.new("go shopping")
todo_2 = Todo.new("wash clothes")
list.add(todo_1)
list.add(todo_2)
list.give_up
list.complete # => [todo_1, todo_2]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Diary

# 1. Initially has empty list
diary = Diary.new
diary.list_all # => []

# DiaryEntry

# 1. It constructs
entry = DiaryEntry.new("title_1", "contents_1")
entry.title # => "title_1"
entry.contents # => "contents_1"

# 2. It returns the reading time in minutes of the contents for a given wpm
entry = DiaryEntry.new("title_1", "one two three four five")
entry.reading_time(2) # => 3

# 3. it extracts numbers from contents
entry = DiaryEntry.new("title_1", "call me on 07987123456")
entry.extract_numbers # => ["07987123456"]

# 4. returns an empty array with no numbers found
entry = DiaryEntry.new("title_1", "one two three four five")
entry.extract_numbers # => [] 

# TodoList
# 1. Initially has empty lists
list = TodoList.new
list.incomplete # => []
list.complete # => []

# Todo
# 1 returns task as string
todo = Todo.new("Go shopping")
todo.task # => "Go shopping"

# 2. returns true if todo is marked as done
todo = Todo.new("Go shopping")
todo.mark_done
todo.done? # => true

# 3. returns false if todo is not marked as done
todo = Todo.new("Go shopping")
todo.done? # => false
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._