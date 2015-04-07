require 'rubygems'
require 'Hasu'

Hasu.load "ball.rb"

class Pong < Hasu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @ball = Ball.new
  end

  def update
    @ball.move!
  end

  def draw
    @ball.draw(self)
  end

  def button_down(id)

  end

  def button_up(id)

  end
end

Pong.run