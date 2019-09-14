class Plateau
  attr_accessor :width, :height

  def initialize
  end

  def rectangular_grid(r_x, r_y)
    @width = r_x.to_i
    @height = r_y.to_i
  end

  def next_step(rv_inst)
    case rv_inst.dir_face
    when "N"
      [rv_inst.init_x, rv_inst.init_y + 1]
    when "S"
      [rv_inst.init_x, rv_inst.init_y - 1]
    when "E"
      [rv_inst.init_x + 1, rv_inst.init_y]
    else
      [rv_inst.init_x - 1, rv_inst.init_y]
    end
  end

  # get next step and do error check
  def get_next_coords_with_check(rv_inst)
    x, y = next_step(rv_inst)
    return false unless within_boundary?(x, y)
    [x, y]
  end

  def within_boundary?(x, y)
    x >= 0 && x < @width && y >= 0 && y < @height
  end
end
