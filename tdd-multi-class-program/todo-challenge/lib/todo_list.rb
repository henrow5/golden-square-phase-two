class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @todos << todo
  end

  def incomplete
    # Returns all non-done todos
    return @todos.filter { |todo| !todo.done? }
  end

  def complete
    # Returns all complete todos
    return @todos.filter { |todo| todo.done? }
  end

  def give_up!
    # Marks all todos as complete
    @todos.each { |todo| todo.mark_done! }
  end
end
