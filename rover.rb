
class Rover
  attr_accessor :init_x, :init_y, :dir_face

  def initialize(x, y, dir_face)
    @init_x = x.to_i
    @init_y = y.to_i
    @dir_face = dir_face
  end

  def turn(pos)
    @dir_face = pos
  end

  def move(coords)
    @init_x = coords[0]
    @init_y = coords[1]
  end
end
