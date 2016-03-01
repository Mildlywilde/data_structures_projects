class Node
	attr_accessor :value, :parent, :children  

	def initialize(value, children={:left => nil, :right => nil})   
		@value = value
		@children = children
	end

	def add_child(child_val)
		if child_val < @value
			if @children[:left] != nil
				@children[:left].add_child(child_val)
			else 
				@children[:left] = Node.new(child_val)
			end
		else child_val > @value
			if @children[:right]
				@children[:right].add_child(child_val)
			else
				@children[:right] = Node.new(child_val)
			end
		end
	end
end

class BST

	attr_reader :root

	def initialize(ary)
		ary.shuffle!
		@root = Node.new(ary.shift)
		build_tree(ary)
	end

	def build_tree(ary)
		ary.each do |element|
			@root.add_child(element)
		end
		@root
	end

	def breadth_first_search(target)
		if @root.value == target
			return @root
		else
			return bfs_child_search(@root, target)

		end
	end

	def bfs_child_search(parent, target, queue=[], answer=nil)
		found = false
		ary = parent.children.values
		ary.each do |node|
			if node.class != Node
				next
			elsif node.value == target
				answer = node
				break
			else
				queue.unshift(node)
			end
		end
		if found == false
			focus = queue.pop
			bfs_child_search(focus, target, queue)
		else 
			return answer
		end
	end
end

tree = BST.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])



search = tree.breadth_first_search(67)

puts search