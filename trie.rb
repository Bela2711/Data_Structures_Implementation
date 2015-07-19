class Node
	attr_accessor :is_word, :children
	def initialize
		@children = Hash.new		
		@is_word=false		
	end

	def insert(substring)
		if substring.eql? '$'
			children['$']=nil
			return
		end			
		if !children.has_key?(substring[0])
			newnode = Node.new
			children[substring[0]] = newnode
		end		
		if substring[1].eql? '$'			
			newnode.is_word=true
		end
		return children[substring[0]].insert(substring[1..-1])
	end

	def print
		puts is_word
		puts children
		children.each_value { |val|  		
			if !val.nil?
				val.print					
			end			
		}
	return
	end

	def search(searchstring)
		if searchstring.eql? '$'
			return true
		end
		if !children.has_key?(searchstring[0])
			return false
		elsif children.has_key?(searchstring[0])
			children[searchstring[0]].search(searchstring[1..-1])
		end
	end
end

class Trie
	attr_accessor :root
	def initialize
		@root = Node.new
	end
	def insert(string)
		root.insert(string)
	end

	def print
		root.print
	end

	def search(searchstring)
		root.search(searchstring)
	end
end

trie = Trie.new
trie.insert('a$')
trie.insert('abc$')
trie.insert('abd$')
trie.insert('dada$')
puts trie.search('dad$')