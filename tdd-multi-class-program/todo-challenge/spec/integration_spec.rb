require "todo_list"
require "todo"

describe "TodoList integration" do
  it "returns a list of incomplete todos" do
    list = TodoList.new
    todo_1 = Todo.new("Go shopping")
    todo_2 = Todo.new("Cook dinner")
    todo_3 = Todo.new("Wash clothes")
    list.add(todo_1)
    list.add(todo_2)
    list.add(todo_3)
    todo_3.mark_done!
    expect(list.incomplete).to eq [todo_1, todo_2]
  end

  it "returns a list of completed todos" do
    list = TodoList.new
    todo_1 = Todo.new("Go shopping")
    todo_2 = Todo.new("Cook dinner")
    todo_3 = Todo.new("Wash clothes")
    list.add(todo_1)
    list.add(todo_2)
    list.add(todo_3)
    todo_3.mark_done!
    expect(list.complete).to eq [todo_3]
  end

  it "marks all todos as complete" do
    list = TodoList.new
    todo_1 = Todo.new("Go shopping")
    todo_2 = Todo.new("Cook dinner")
    todo_3 = Todo.new("Wash clothes")
    list.add(todo_1)
    list.add(todo_2)
    list.add(todo_3)
    list.give_up!
    expect(list.complete).to eq [todo_1, todo_2, todo_3]
  end
end
