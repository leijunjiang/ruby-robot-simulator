class Robot
	

	def initialize
		@coord = []
		@DIRECTION
	end

	def bearing
		@DIRECTION
	end

	def orient(direction) 
		if [:east, :west, :north, :south].include?(direction)
		@DIRECTION = direction
		else 
			raise ArgumentError
		end
	end

	def turn_left
		case @DIRECTION 
		when @DIRECTION = :east then @DIRECTION = :north
		when @DIRECTION = :north then @DIRECTION = :west
		when @DIRECTION = :west then @DIRECTION = :south
		when @DIRECTION = :south then @DIRECTION = :east
		end
	end

	def turn_right
		case @DIRECTION 
		when @DIRECTION = :east then @DIRECTION = :south
		when @DIRECTION = :north then @DIRECTION = :east
		when @DIRECTION = :west then @DIRECTION = :north
		when @DIRECTION = :south then @DIRECTION = :west
		end
	end

	def at(x,y)
		@coord[0] = x
		@coord[1] = y
	end
	def coordinates
		@coord
	end

	def advance
		if @DIRECTION == :north
			@coord[1] += 1
		elsif @DIRECTION == :south
			@coord[1] -= 1
		elsif	@DIRECTION == :east
			@coord[0] += 1
		elsif	@DIRECTION == :west
			@coord[0] -= 1
		end
		@coord
	end
end

class Simulator

	def initialize
		@orders = {"L" => :turn_left,"R" => :turn_right, "A" => :advance}
	end

	def instructions(order)
		out = []
		i  = 0
		while i < order.length do
			out << @orders[order[i]]
			i +=1
		end
		out
		#[@orders[order]]
	end

	def place(robot, hash = {})
		robot.at(hash[:x],hash[:y])
		robot.orient(hash[:direction])
	end

	def evaluate(robot, commanders)
	 self.instructions(commanders).each {|instru| robot.send(instru) } 
	end
end



