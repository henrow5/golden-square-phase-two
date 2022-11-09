# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

is_correct = grammar_check(text)

# text: string containing the words 
# is_correct: is a boolean 
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
grammar_check('') => fail "Invalid sentence."

# 2 
grammar_check('Hello, I am David.') => true 

# 3
grammar_check('Hello, I am David') => false

# 4
grammar_check('hello, I am David.') => false 

# 5
grammar_check('hello, I am David') => false 

# 6
grammar_check('HELLO, I am David.') => true

# 7
grammar_check('Hello, I am David!') => true 

# 8
grammar_check('Hello, I am David?') => true 

# 9
grammar_check('Hello, I am David,') => false
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
