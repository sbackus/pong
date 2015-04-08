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

    if button_down?(Gosu::KbW)
      @left_paddle.up!
    end

    if button_down?(Gosu::KbS)
      @left_paddle.down!
    end

    if button_down?(Gosu::KbUp)
      @right_paddle.up!
    end

    if button_down?(Gosu::KbDown)
      @right_paddle.down!
    end

    if @ball.intersect?(@left_paddle)
      @ball.bounce_off_paddle!(@left_paddle)
    end

    if @ball.intersect?(@right_paddle)
      @ball.bounce_off_paddle!(@right_paddle)
    end

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