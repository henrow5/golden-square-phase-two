require "todo_list"

describe TodoList do
  it "initially has empty lists" do
    list = TodoList.new
    expect(list.incomplete).to eq []
    expect(list.complete).to eq []
  end
end
