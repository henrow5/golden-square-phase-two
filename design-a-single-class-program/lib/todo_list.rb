class TodoList
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def complete(task)
    fail "Task not found." unless @tasks.include?(task)
    @tasks.delete(task)
  end

  def list
    @tasks
  end
end
