
class Direction
  attr_accessor :position

  DIR_MATRIX = {
    "N" => {
      "L" => "W",
      "R" => "E",
    },
    "S" => {
      "L" => "E",
      "R" => "W",
    },
    "E" => {
      "L" => "N",
      "R" => "S",
    },
    "W" => {
      "L" => "S",
      "R" => "N",
    },
  }

  def initialize(rv_inst, plat_inst)
    @rv_inst = rv_inst
    @plat_inst = plat_inst
    @position = rv_inst.dir_face
  end

  def get_coords
    @plat_inst.get_coords(@rv_inst)
  end

  def check_dir(dir)
    if dir == "M"
      dec = @plat_inst.get_next_coords_with_check(@rv_inst)
      return false unless dec
      @rv_inst.move(dec)
    else
      @rv_inst.turn(DIR_MATRIX[@rv_inst.dir_face][dir])
    end
  end
end
