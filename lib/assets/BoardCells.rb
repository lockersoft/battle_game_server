module BoardCells

  class Cell
    attr_accessor :has_ship, :hit, :miss
    def initialize
      @has_ship = false
      @hit = false
      @miss = false
    end
  end

  class Cells
    attr_accessor :content
    def initialize #width, height)
      @content = new Array( 10 ){ new Array(10){ Cell.new } }
    end
  end
  
end