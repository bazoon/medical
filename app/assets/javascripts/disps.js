// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//

$(document).ready(function() {
  return $('#disp_mkb').autocomplete({
    source: "/ajax/mkb_types",


    select: function( event, ui ) {
      $(".mkb").val(ui.item.id);
  
  }



  });


});
