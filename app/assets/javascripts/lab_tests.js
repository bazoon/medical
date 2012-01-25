// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//
//
//



$(document).ready(function() {


 $('#lab_test_test_date').focus();

  return $('#lab_test_lab_test_type_name').autocomplete({
    source: "/ajax/lab_test_types"
  });




});

