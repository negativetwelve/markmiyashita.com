$(document).ready(function() {
  var relative = window.location.pathname;
  var absolute = $(location).attr('href');
  if (relative == '/' && absolute.slice(-1) != '/') {
    section = absolute.split('#')[1].toLowerCase();
    if (section != 'projects') {
      loadSection(section);
    } else {
      loadProjects();
    }
  } else {
  }
  
  $('.load-projects').click(function() {
    loadProjects();
  });
  
  //$('.resume .row.company-modal').click(function() {
    //$('#' + $(this).attr('data-reveal-id')).reveal();
  //});

  $('.load-item').click(function() {
    loadSection($(this).context.text);
  });
  
  $('.load-contact').click(function() {
    loadSection('contact');
  });
});

function loadSection(location) {
  $('section').stop().slideUp();
  var section = $('.' + location.toLowerCase());
  $(section).stop().slideDown(function() {
    $('html, body').animate({
      scrollTop: $("#content").offset().top
    }, 10);
  });
};

function loadProjects() {
  $('section').stop().slideUp();
  var section = $('.resume');
  $(section).stop().slideDown(function() {
    $('html, body').animate({
      scrollTop: $("#projects").offset().top
    }, 200);
  });
};