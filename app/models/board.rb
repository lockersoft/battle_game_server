#require_relative "../../lib/assets/BoardCells"
class Board < ActiveRecord::Base
  
  WIDTH = 26    # The only way I could think to create during the serialize - can't pass args to the default object in the serialize method
  HEIGHT = 26
  LETTERS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  
  class Cell
    attr_accessor :has_ship, :hit, :miss
    
    def initialize
      @has_ship = false
      @hit = false
      @miss = false
    end
    
    def to_s
      if @has_ship
        "S"
      elsif @hit
        "*"
      elsif @miss
        "-"
      else
        " "
      end
    end
  end

  class Cells
    attr_accessor :content
    
    def initialize
      @content = Array.new( HEIGHT ){ Array.new(WIDTH){ Cell.new } }
    end
    
    def calculate_direction( dir )
      row_dir = 0
      col_dir = 0
      
      case dir
        when 0      # North 
          row_dir = -1 
        
        when 1      # North East
          row_dir = -1
          col_dir = -1
        
        when 2      # East 
          col_dir = 1
        
        when 3      # South East 
          row_dir = 1
          col_dir = 1
        
        when 4      # South
          row_dir = 1 
        
        when 5      # South West 
          row_dir = 1
          col_dir = -1
        
        when 6      # West 
          col_dir = -1 
        
        when 7      # North West 
          row_dir = -1
          col_dir = -1
        
      end
      return row_dir, col_dir  
    end
    
    def add_ship(s)
      row = s.start_row
      col = s.start_col
      row_dir, col_dir = calculate_direction( s.direction )
      
      s.size.times do
        @content[row][col].has_ship = true
        row += row_dir
        col += col_dir        
      end
      s.board.save!
      # TODO: Bounds checking for ships
    end
  end
  
  serialize :cells, Cells
  has_many :ships
  
  def position_ship( ship )
    cells.add_ship( ship )
  end
  
  def to_s
    ret_str = "  "
    1.upto(width) { |n| ret_str += "#{n}".center(4," ") }
    ret_str += "\n  +" + ((("–" * 3) + "+" ) * width) + "\n"
    cells.content.each_with_index do | row, i |
      break if i >= width
      ret_str += LETTERS[i] + " "
      row.each_with_index do | col, i |
        break if i >= height
        ret_str += "| #{col} " 
      end
      ret_str += "|\n"
      ret_str += "  +" + ((("–" * 3) + "+" ) * width) + "\n"
    end
    return ret_str
  end
end
