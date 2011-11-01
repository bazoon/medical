// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//

$(document).ready(function() {

  return $('#hospitalization_mkb').autocomplete({
    source: "/ajax/mkb_types",

    select: function( event, ui ) {
      $("#hospitalization_mkb_type_id").val(ui.item.id);
    return false;
  }




  });


});
