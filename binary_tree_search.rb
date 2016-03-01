class Node
	attr_accessor :value, :parent, :lchild, :rchild  

	def initialize(value, parent=nil, left_child=nil, right_child=nil) 
		@value = value
		@parent = parent
		@lchild = left_child
		@rchild = right_child
	end

	def add_child(child_val)
		if child_val < @value
			if @lchild
				@lchild.add_child(child_val)
			else 
				@lchild = Node.new(child_val, self)
			end
		else child_val > @value
			if @rchild
				@rchild.add_child(child_val)
			else
				@rchild = Node.new(child_val, self)
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
		queue = [@root]
		until queue.empty?
			focus = queue.shift
			return focus if focus.value == target
			queue.push focus.lchild unless focus.lchild.nil?
			queue.push focus.rchild unless focus.rchild.nil?
		end
	end

	def depth_first_search(target)
		stack = [@root]
		until stack.empty?
			focus = stack.pop
			return focus if focus.value == target
			stack.push focus.lchild unless focus.lchild.nil?
			stack.push focus.rchild unless focus.rchild.nil?
		end
	end

	def dfs_rec(target, focus=@root, searched=[])
		if focus.value == target
			return focus
		elsif focus.lchild != nil && searched.include?(focus.lchild) == false
			searched << focus.lchild
			dfs_rec(target, focus.lchild, searched)
		elsif focus.rchild != nil && searched.include?(focus.rchild) == false
			searched << focus.rchild
			dfs_rec(target, focus.rchild, searched)
		else
			dfs_rec(target, focus.parent, searched)
		end
	end

end

tree = BST.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

search = tree.dfs_rec(1)
puts search
puts search.value