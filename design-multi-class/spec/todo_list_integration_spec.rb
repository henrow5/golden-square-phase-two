require "todo_list"
require "todo"

describe "TodoList integration" do
  it "lists incomplete to-dos" do
    list = TodoList.new
    todo_1 = Todo.new("go shopping")
    todo_2 = Todo.new("wash clothes")
    list.add(todo_1)
    list.add(todo_2)
    todo_1.mark_done
    expect(list.incomplete).to eq [todo_2]
  end

  it "Lists complete to-dos" do
    list = TodoList.new
    todo_1 = Todo.new("go shopping")
    todo_2 = Todo.new("wash clothes")
    list.add(todo_1)
    list.add(todo_2)
    todo_1.mark_done
    expect(list.complete).to eq [todo_1]
  end

  it "marks all to-dos as done" do
    list = TodoList.new
    todo_1 = Todo.new("go shopping")
    todo_2 = Todo.new("wash clothes")
    list.add(todo_1)
    list.add(todo_2)
    list.give_up
    expect(list.complete).to eq [todo_1, todo_2]
  end
end
