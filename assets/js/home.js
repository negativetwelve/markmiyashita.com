$(document).ready(function() {
  $('a.solution_toggle').click(function(event) {
    event.preventDefault();
    $(".solution").toggle();
  });

  styleCode();

  $(document).click(function(event) {
    $('#sub-links').slideUp('medium');
  });
  
  $('a#dropdown-button').click(function(event) {
    event.stopPropagation();
    event.preventDefault();
    $('#sub-links').slideDown('medium');
  });
    //$('#dropdown-menu').slideUp('medium');

});


function styleCode() {
  if (typeof disableStyleCode != "undefined") {
    return;
  }
  var a = false;
  $("code").each(function() {
    if (!$(this).hasClass("prettyprint")) {
      $(this).addClass("prettyprint");
      a = true
    }
  });
  if (a) { prettyPrint() }
}
