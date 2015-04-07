require "Hasu"

Hasu.load "ball.rb"

class Pong < Hasu::Window
  def initialize
    super(640, 480, false)
  end

  def reset
    # ...
  end

  def update
    # ...
  end

  def draw
    # ...
  end
end

Pong.run