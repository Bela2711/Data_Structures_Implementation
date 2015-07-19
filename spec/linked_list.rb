require "./linked_list"
describe LinkedList do
  it "has a head" do
    ll = LinkedList.new
    expect(ll.head).to be_nil
    ll.add(1)
    expect(ll.head.value).to eql(1)
  end
 
  it "has a tail" do
    ll = LinkedList.new
    ll.add(1)
    expect(ll.tail.value).to eql(1)
    ll.add(2)
    expect(ll.tail.value).to eql(2)
    expect(ll.tail.next_node).to be_nil
  end
 
  it "adds a value" do
    ll = LinkedList.new
    ll.add(1)
    ll.add(2)
    ll.add(3)
    expect(ll.head.value).to eql(1)
    expect(ll.tail.value).to eql(3)
  end
 
  it "finds a node" do
    ll = LinkedList.new
    10.times do |i|
      ll.add(i)
    end
    node_4 =  ll.find(4)
    expect(node_4.value).to eql(4)
    node_5 =  ll.find(5)
    expect(node_5.value).to eql(5)
  end
 
  it "removes a node" do
    ll = LinkedList.new
    10.times do |i|
      ll.add(i)
    end
    node_4 =  ll.find(4)
    expect(node_4.next_node.value).to eql(5)
    ll.remove(5)
    expect(node_4.next_node.value).to eql(6)
  end
  
  it "has a length" do
    ll = LinkedList.new
    10.times do |i|
      ll.add(i)
    end
    expect(ll.length).to eql(9)  
  end


  it "reverses a linked list" do
    ll = LinkedList.new
    ll.add(3)
    ll.add(2)
    ll.add(5)
    ll.add(6)
    expect(ll.head.value).to eql(3)
    expect(ll.tail.value).to eql(6)
    ll.reverse
    expect(ll.head.value).to eql(6)
    expect(ll.tail.value).to eql(3)
  end
end