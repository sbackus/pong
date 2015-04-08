class Paddle
	WIDTH = 16
	HEIGHT = 96
	SPEED = 6

	attr_reader :side, :y, :ai
	alias ai? ai

	def initialize(side, ai=false)
		@ai = ai
		@side = side
		@y = Pong::HEIGHT/2
	end

	def up!
		unless y1 < 0; @y -= SPEED; end
	end

	def down!
		unless y2 > Pong::HEIGHT; @y += SPEED; end
	end

	def x1
		case side
		when :left
			0
		when :right
			Pong::WIDTH - WIDTH
		end
	end

	def x2
		x1 + WIDTH
	end

	def y1
		y - HEIGHT/2
	end

	def y2
		y1 + HEIGHT
	end

	def draw(window)
		color = Gosu::Color::WHITE
		window.draw_quad(
			x1, y1, color,
			x1, y2, color,
			x2, y2, color,
			x2, y1, color,
		)
	end

	def ai_move!(ball)
		if y > ball.y 
			up!
		elsif y < ball.y
			down!
		end
	end
end