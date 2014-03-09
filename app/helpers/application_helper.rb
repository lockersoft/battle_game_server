module ApplicationHelper
  
  def display_board( board )
    #  Display the board as HTML
    ret_str = "<pre>"
    ret_str += board.to_s.gsub( "\n", "<br>")
    ret_str += "</pre>"
    return ret_str.html_safe
  end
end
