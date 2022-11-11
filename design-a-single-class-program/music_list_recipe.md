# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class MusicList
  def initializer
  end

  def add(track) # track : string of name of the track
  # Returns nothing
  # Fails if track is already on the list
  end

  def list
  # Returns the track list
  end
end


```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 1
tracks = MusicList.new 
tracks.list => []

# 2 
tracks = MusicList.new 
tracks.add('Never Gonna Give You Up')
tracks.list => ['Never Gonna Give You Up']

# 3
tracks = MusicList.new 
tracks.add('Never Gonna Give You Up')
tracks.add('Together Forever')
tracks.list => ['Never Gonna Give You Up', 'Together Forever']

# 4
tracks = MusicList.new 
tracks.add('Never Gonna Give You Up')
tracks.add('Together Forever')
tracks.add('Never Gonna Give You Up') => fails "Track already on the list."

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
