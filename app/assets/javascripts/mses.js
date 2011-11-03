// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//



$(document).ready(function() {

  return $('#mkb').autocomplete({
    source: "/ajax/mkb_types",

    select: function( event, ui ) {
      $(".mkb").val(ui.item.id);
    return false;
  }

  });
});



$(document).ready(function() {

		$('#calendar').fullCalendar({
           	header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: false,
			
			events: "/mse_events",
			
			eventDrop: function(event, delta) {
				alert(event.title + ' was moved ' + delta + ' days\n' +
					'(should probably update your database)');


                        



			},
			
			loading: function(bool) {
				if (bool) $('#loading').show();
				else $('#loading').hide();
			}
			
		});
		
	});
