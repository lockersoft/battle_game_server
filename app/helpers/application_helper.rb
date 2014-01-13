module ApplicationHelper
  
  def display_board( board_id )
    #  Display the board as HTML
    board = Board.find_by_id( board_id )
    ret_str = "<pre>"
    ret_str += board.to_s.gsub( "\n", "<br>")
    ret_str += "</pre>"
    return ret_str.html_safe
  end
end
