// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//


$(function () {
  $('#ref_lab_test_type_lab_test_group_tokens').tokenInput('/ajax/lab_test_groups',
   { crossDomain: false,
     prePopulate: $('#ref_lab_test_type_lab_test_group_tokens').data('pre'),
     theme: 'facebook',
     searchingText: "Идет поиск...",
     hintText: "Наберите слово для поиска",
     noResultText: "Ничего не найдено"
   });
});


$(document).ready(function(){  

  $('#lab_test_types th a,#lab_test_types .pagination a').live('click', function () {
    $.getScript(this.href);
    return false;
  });


 // Search form.
  $('#lab_test_type_search').submit(function () {
    $.get(this.action, $(this).serialize(), null, 'script');
    return false;
  });



});  




