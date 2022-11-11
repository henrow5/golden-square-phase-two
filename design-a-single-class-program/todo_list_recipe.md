# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem
    As a user
    So that I can keep track of my tasks
    I want a program that I can add todo tasks to and see a list of them.

    As a user
    So that I can focus on tasks to complete
    I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TodoList
  def initialize
  end

  def add(task) # task is a task string
    # Nothing returned
  end

  def complete(task) # task is task string to be marked complete
    # Returns nothing
    # Fails if task not present in the task list
  end

  def list
    # Returns task list
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 1
todo_list = TodoList.new 
todo_list.list => []


# 2
todo_list = TodoList.new 
todo_list.add('cook dinner')
todo_list.list => ['cook dinner']

# 3
todo_list = TodoList.new 
todo_list.add('cook dinner')
todo_list.add('hang laundry')
todo_list.list => ['cook dinner', 'hang laundry']

# 4
todo_list = TodoList.new 
todo_list.add('cook dinner')
todo_list.add('hang laundry')
todo_list.complete('cook dinner')
todo_list.list => ['hang laundry']

# 5
todo_list = TodoList.new 
todo_list.add('cook dinner')
todo_list.add('hang laundry')
todo_list.complete('clean kitchen') => fails "Task not found."
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
