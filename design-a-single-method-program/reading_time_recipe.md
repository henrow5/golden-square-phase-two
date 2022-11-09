# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
reading_time = reading_time(text)

# text: string containing the words 
# reading_time: integer representing the minutes
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
calculate_reading_time('') => 0 

# 2 
calculate_reading_time('one') => 1 

# 3
calculate_reading_time(TWO_HUNDERED_WORDS) => 1

# 4
calculate_reading_time(THREE_HUNDRED_WORDS) => 2 

# 5
calculate_reading_time(FOUR_HUNDRED_WORDS) => 2 

# 6
calculate_reading_time(FIVE_THOUSAND_WORDS) => 25 
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
