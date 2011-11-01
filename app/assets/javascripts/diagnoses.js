// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//

$(document).ready(function() {

  return $('#mkb').autocomplete({
    source: "/ajax/mkb_types",

    select: function( event, ui ) {
      $("#diagnosis_mkb_type_id").val(ui.item.id);
    return false;
  }

  });
});
