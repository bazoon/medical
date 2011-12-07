// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//

$(document).ready(function() {

 $(".hosp").click(function() {
 
  $("#hosp_data").show();
 
 });



 $(".nohosp").click(function() {
 
  // alert("ggg");
  $("#hosp_data").hide();
 
 });

  return $('#hospitalization_mkb').autocomplete({
    source: "/ajax/mkb_types"
  });




});
