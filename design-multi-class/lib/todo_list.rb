class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo: instance of Todo
    # Returns nothing
    @todos << todo
  end

  def incomplete
    # Returns all incomplete to-dos
    return @todos.filter { |todo| !todo.done? }
  end

  def complete
    # Returns all complete to-dos
    return @todos.filter { |todo| todo.done? }
  end

  def give_up
    # Marks all to-dos as complete
    @todos.each { |todo| todo.mark_done }
  end
end
