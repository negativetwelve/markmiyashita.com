$(document).ready(function() {
  $('a.solution_toggle').click(function(event) {
    event.preventDefault();
    $(".solution").toggle();
  });

  styleCode();

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
