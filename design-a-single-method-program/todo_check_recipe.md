# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
has_todo = todo_check(text)
# has_todo: boolean
# text: string containing words

```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
todo_check('') => fail "Invalid to-do"

# 2 
todo_check('Go shopping') => false

# 3
todo_check('#todo Go shopping') => false

# 4
todo_check('#TODO Go shopping') => true

# 5
todo_check('Go shopping #TODO') => true

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
