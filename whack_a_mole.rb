require "gosu"

class WhackAMole < Gosu::Window
  def initialize
    @screen_width  = 800
    @screen_height = 600

    super(@screen_width, @screen_height)
    self.caption = "Whack a mole!"

    @mole = Gosu::Image.new("mole.png")
    @hammer = Gosu::Image.new("hammer.png")

    @x = 200
    @y = 200
    @width  = 128
    @height = 128
    @velocity_x = 4
    @velocity_y = 4
    @visible = 0
    @hit = 0
  end

  def draw
    if @visible > 0
      @mole.draw(@x - @width / 2, @y - @height / 2, 1)
    end

    @hammer.draw(mouse_x - 40, mouse_y - 10, 1)
    c = case @hit
        when 0
          Gosu::Color::NONE
        when 1
          Gosu::Color::GREEN
        when -1
          Gosu::Color::RED
        end

    draw_quad(0, 0, c, @screen_width, 0, c, @screen_width, @screen_height, c, 0, @screen_height, c)
    @hit = 0
  end

  def update
    @x += @velocity_x
    @y += @velocity_y
    @velocity_x *= -1 if @x + @width  / 2 > @screen_width  || @x - @width  / 2 < 0
    @velocity_y *= -1 if @y + @height / 2 > @screen_height || @y - @height / 2 < 0
    @visible -= 1
    @visible = 60 if @visible < -10 && rand < 0.01
  end

  def button_down(id)
    if id == Gosu::MsLeft
      if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
        @hit = 1
      else
        @hit = -1
      end
    end
  end
end

window = WhackAMole.new
window.show
