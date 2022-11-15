require "todo"

describe Todo do
  describe "#task" do
    it "returns task as string" do
      todo = Todo.new("Go shopping")
      expect(todo.task).to eq "Go shopping"
    end
  end

  describe "#mark_done" do
    it "returns true if todo is marked as done" do
      todo = Todo.new("Go shopping")
      todo.mark_done
      expect(todo.done?).to eq true
    end

    it "returns false if todo is not marked as done" do
      todo = Todo.new("Go shopping")
      expect(todo.done?).to eq false
    end
  end
end
