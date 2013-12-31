# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#players').dataTable
          bJQueryUI: true
          iDisplayLength: 5
          bLengthChange: true
          bPaginate: true
          aLengthMenu: [[5, 10, 50, -1], [5, 10, 50, "All"]]
          bStateSave: true
          sDom: 'p<"H"lfr>t<"F"ip>'    # Set to have the pagination on both top and bottom (p)
          sPaginationType: "full_numbers"
          