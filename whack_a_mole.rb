require "gosu"

class WhackAMole < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "Whack a mole!"

    @image = Gosu::Image.new("mole.png")
    @x = 200
    @y = 200
    @width  = 128
    @height = 128
    @velocity_x = 4
    @velocity_y = 4
    @visible = 0
  end

  def draw
    if @visible > 0
      @image.draw(@x - @width / 2, @y - @height / 2, 1)
    end
  end

  def update
    @x += @velocity_x
    @y += @velocity_y
    @velocity_x *= -1 if @x + @width  / 2 > 800 || @x - @width  / 2 < 0
    @velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height / 2 < 0
    @visible -= 1
    @visible = 60 if @visible < -10 && rand < 0.01
  end
end

window = WhackAMole.new
window.show
