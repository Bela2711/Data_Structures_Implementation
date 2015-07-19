require "./Stack.rb"
class Node
	attr_accessor :data,:left,:right
	def initialize(data)
		@data = data
		@left = nil
		@right = nil
	end	

	def insert_child(data)
		if data < self.data
			if self.left.nil?
				self.left = Node.new(data)
			else
				self.left.insert_child(data)
			end
		elsif data > self.data
			if self.right.nil?
				self.right = Node.new(data)
			else
				self.right.insert_child(data)
			end
		end
	end

	#recurssive
	def preorder
		if self.nil? 
			return
		end
		puts self.data
		if !self.left.nil?
			self.left.preorder
		end
		if !self.right.nil?
			self.right.preorder
		end
	end

	def inorder
		if self.nil? 
			return
		end		
		if !self.left.nil?
			self.left.inorder
		end
		puts self.data
		if !self.right.nil?
			self.right.inorder
		end
	end

	def inorder(nodes)
		stack = Stack.new(nodes)
		current = self
		stack.push(current)
		while !stack.empty?
			while !current.nil?
				current = current.left
				stack.push(current)
			end
			if current.nil?
				popped = stack.pop
				puts popped.data						
				current = popped.right		
				stack.push(current)	
			end
		end
	end

	# non-recurssive
	def preorder(nodes)		
		stack = Stack.new(nodes)			
		stack.push(self)		
		while !stack.empty?			
			popped = stack.pop
			puts popped.data		
			if !popped.right.nil?				
				stack.push(popped.right)
			end
			if !popped.left.nil?				
				stack.push(popped.left)
			end
		end		
	end
end

class Tree
	attr_accessor :root,:number_of_nodes
	def initialize
		@root = nil
		@number_of_nodes = 0
	end

	def insert(data)	
		if @root.nil? 
			node = Node.new(data)
			@root = node
		else
			@root.insert_child(data)
		end
		@number_of_nodes = @number_of_nodes + 1
	end

	def preorder_traversal
		@root.preorder
	end

	def inorder_traversal
		@root.inorder
	end

	def preorder_traversal_with_stack
		@root.preorder(@number_of_nodes)
	end
	def inorder_traversal_with_stack
		@root.inorder(@number_of_nodes)
	end

end
tree = Tree.new
tree.insert(5)
tree.insert(6)
tree.insert(4)
tree.insert(2)
tree.inorder_traversal_with_stack