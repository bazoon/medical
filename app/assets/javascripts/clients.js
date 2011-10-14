// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
$(document).ready(function() {
    $("#accordion").accordion();
    $("#dialog").dialog();

  });


jQuery(document).ready(function(){
	$('.accordion .head').click(function() {
		$(this).next().toggle();
		return false;
	}).next().hide();
});


$(function() {
		$( "#tabs" ).tabs();
	});
