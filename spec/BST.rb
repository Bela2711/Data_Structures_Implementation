require './BST'

describe Node do
	it "has value" do
		node = Node.new(5)
		expect(node.data).to eql(5)
		expect(node.left).to be_nil
	end
end

describe Tree do
	it "has only one node" do		
		tree = Tree.new
		tree.insert(5)
		expect(tree.root.data).to eql(5)		
	end

	it "has more nodes" do
		tree = Tree.new
		tree.insert(5)
		tree.insert(6)
		expect(tree.root.data).to eql(5)
		right_of_root = tree.root.right
		expect(right_of_root.data).to eql(6)
		tree.insert(4)
		left_of_root = tree.root.left
		expect(left_of_root.data).to eql(4)
		tree.insert(2)
		left_left_of_root = left_of_root.left
		expect(left_left_of_root.data).to eql(2)
		#tree.preorder_traversal
		tree.preorder_traversal_with_stack
	end
end