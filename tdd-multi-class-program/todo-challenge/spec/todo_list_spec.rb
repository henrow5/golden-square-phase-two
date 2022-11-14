require "todo_list"

describe TodoList do
  context "initial conditions" do
    it "to-do list is empty when calling incomplete" do
      list = TodoList.new
      expect(list.incomplete).to eq []
    end

    it "to-do list is empty when calling complete" do
      list = TodoList.new
      expect(list.complete).to eq []
    end
  end
end
