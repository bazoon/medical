// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
//
//

$(document).ready(function() {
  return $('#search').autocomplete({
    source: "/ajax/clients"
  });


});

$(document).ready(function(){  
 $( "#accordion" ).accordion({ autoHeight: false });
 
});  



$(document).ready(function() {

  return $('#mkb').autocomplete({
    source: "/ajax/mkb_types",

    select: function( event, ui ) {
      $("#diagnosis_mkb_type_id").val(ui.item.id);

    return false;
  }




  });


});
