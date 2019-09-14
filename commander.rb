require_relative "direction"

class Commander
  attr_accessor :rv_inst, :dir_inst, :plat_inst, :msg
  VALID_COMMANDS = %w[L R M].freeze

  def initialize(inp, rover_inst, plat_inst)
    @directions = inp
    @rv_inst = rover_inst
    @plat_inst = plat_inst
    @dir_inst = Direction.new(@rv_inst, @plat_inst)
    @msg = true
    each_command
  end

  def each_command
    @directions.each { |dir|
      return false unless VALID_COMMANDS.include?(dir)
      message = @dir_inst.check_dir(dir)
      if message == false
        puts "You are accessing outside the grid!"
        @msg = false
        break
      end
    }
    @msg
  end

  def coords
    [@rv_inst.init_x, @rv_inst.init_y, @rv_inst.dir_face]
  end
end
