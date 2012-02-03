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

$(document).ready(function() {
  return $('#client_search').autocomplete({
    source: "/ajax/clients"
  });


});

$(document).ready(function(){  
 $( "#accordion" ).accordion({clearStyle: true});

 });  



$(document).ready(function(){
  $.datepicker.setDefaults( $.datepicker.regional["ru"] );
  $('input.ui-datepicker').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: "dd.mm.yy"
  });
});


$(document).ready(function(){  
$('.dropdown-toggle').dropdown()

});  


$(document).ready(function() {
/* Activating Best In Place */
jQuery(".best_in_place").best_in_place()
});
