// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function () {
  $('#med_diagnostic_test_doctor_tokens').tokenInput('/ajax/doctor_types',
   { crossDomain: false,
     prePopulate: $('#med_diagnostic_test_doctor_tokens').data('pre'),
     theme: 'facebook',
     searchingText: "Идет поиск...",
     hintText: "Наберите слово для поиска",
     noResultText: "Ничего не найдено"
   });
});
