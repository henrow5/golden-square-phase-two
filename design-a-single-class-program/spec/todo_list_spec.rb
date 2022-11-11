require "todo_list"

describe TodoList do
  context "No tasks added" do
    it "Returns an empty list" do
      todo_list = TodoList.new
      expect(todo_list.list).to eq []
    end
  end

  context "Adding a task" do
    it "Returns the list with the added task" do
      todo_list = TodoList.new
      todo_list.add("cook dinner")
      expect(todo_list.list).to eq ["cook dinner"]
    end
  end

  context "Adding two tasks" do
    it "Returns the list with the added tasks" do
      todo_list = TodoList.new
      todo_list.add("cook dinner")
      todo_list.add("hang laundry")
      expect(todo_list.list).to eq ["cook dinner", "hang laundry"]
    end
  end

  context "Completing a task" do
    it "Returns the list with the completed task removed" do
      todo_list = TodoList.new
      todo_list.add("cook dinner")
      todo_list.add("hang laundry")
      todo_list.complete("cook dinner")
      expect(todo_list.list).to eq ["hang laundry"]
    end
  end

  context "Completing a task not on the list" do
    it "fails" do
      todo_list = TodoList.new
      todo_list.add("cook dinner")
      todo_list.add("hang laundry")
      expect { todo_list.complete("clean kitchen") }.to raise_error "Task not found."
    end
  end
end
