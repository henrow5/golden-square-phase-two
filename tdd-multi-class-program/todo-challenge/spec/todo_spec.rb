require "todo"

describe Todo do
  it "creates" do
    todo = Todo.new("Go shopping")
    expect(todo.task).to eq "Go shopping"
  end

  describe "#mark_done!" do
    it "marks the todo as done" do
      todo = Todo.new("Go shopping")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end

  describe "#done?" do
    it "returns false if todo is not marked as done" do
      todo = Todo.new("Go shopping")
      expect(todo.done?).to eq false
    end
  end
end
