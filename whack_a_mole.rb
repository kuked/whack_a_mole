require "gosu"

class WhackAMole < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "Whack a mole!"

    @image = Gosu::Image.new("mole.png")
    @x = 200
    @y = 200
    @width = 50
    @height = 50
  end

  def draw
    @image.draw(@x - @width / 2, @y - @height / 2, 1)
  end
end

window = WhackAMole.new
window.show
