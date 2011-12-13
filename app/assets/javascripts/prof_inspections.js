// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//
$(document).ready(function(){  
 $(".alert-message").alert(); 


  $('#prof_inspections th a').live('click', function () {
    $.getScript(this.href);
    return false;
  });


 // Search form.
  $('#prof_inspections_search').submit(function () {
    $.get(this.action, $(this).serialize(), null, 'script');
    return false;
  });



});  

function remove_fields(link) {
 $(link).prev("input[type=hidden]").val("1");
 $(link).closest(".fields").hide(); 
}

function add_fields(link, association, content) {
        var new_id = new Date().getTime();
        var regexp = new RegExp("new_" + association, "g");
        $(link).parent().before(content.replace(regexp, new_id));
        $('.mkb').autocomplete({ source: "/ajax/mkb_types" });
}

