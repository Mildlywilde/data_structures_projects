

def possible_moves(origin, moves=[])

		
	location = origin.coords
		

	moves << Square.new([location[0]-2, location[1]+1], origin.depth + 1, origin)
	moves << Square.new([location[0]-2, location[1]-1], origin.depth + 1, origin)
	moves << Square.new([location[0]-1, location[1]+2], origin.depth + 1, origin)
	moves << Square.new([location[0]-1, location[1]-2], origin.depth + 1, origin)
	moves << Square.new([location[0]+1, location[1]+2], origin.depth + 1, origin)
	moves << Square.new([location[0]+1, location[1]-2], origin.depth + 1, origin)
	moves << Square.new([location[0]+2, location[1]+1], origin.depth + 1, origin)
	moves << Square.new([location[0]+2, location[1]-1], origin.depth + 1, origin)
		
	moves.delete_if { |square| square.coords[0] < 1 || square.coords[0] > 8 || square.coords[1] < 0 || square.coords[1] > 8}
	return moves
end

def knight_moves(from, to)

	path = []

	queue = [Square.new(from)]
	until queue.empty?
		focus = queue.shift
		if focus.coords == to
			parent = focus.prev_move
			until parent == nil
				path.unshift(parent.coords)
				parent = parent.prev_move
			end
			path << focus.coords
			puts "Reached target in #{focus.depth} moves: \n #{path}"
			break
		 else
			moves = possible_moves(focus)
			moves.each do |move|
				queue << move
			end
		end
	end
end


class Square

	attr_reader :coords, :depth, :prev_move

	def initialize(coords, depth=0, prev_move=nil)
		@coords = coords
		@depth = depth
		@prev_move = prev_move
	end
end



knight_moves([3,3], [4,3])
