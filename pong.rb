require 'rubygems'
require 'Hasu'

Hasu.load "ball.rb"
Hasu.load "paddle.rb"

class Pong < Hasu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @ball = Ball.new
    
    @left_score = 0
    @right_score = 0

    @font = Gosu::Font.new(self, "Ariel", 30)
    @left_paddle = Paddle.new(:left)
    @right_paddle = Paddle.new(:right)
  end

  def update
    @ball.move!

    if @ball.off_left?
      @right_score += 1
      @ball = Ball.new
    end

    if @ball.off_right?
      @left_score += 1
      @ball = Ball.new
    end
  end

  def draw
    @ball.draw(self)

    @font.draw(@left_score, 30, 30 , 0, )
    @font.draw(@right_score, WIDTH-50, 30, 0)

    @left_paddle.draw(self)
    @right_paddle.draw(self)
  end
 
  def button_down(id)

  end

  def button_up(id)

  end
end

Pong.run