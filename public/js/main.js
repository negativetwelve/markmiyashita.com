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
    scrollToContent();
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

function scrollToContent() {
  $('html, body').animate({
    scrollTop: $("#content").offset().top
  }, 10);
}

function loadSection(location) {
  var loc = location.toLowerCase();
  _gaq.push(['_trackPageview', '/#' + loc]);
  $('section').stop().slideUp();
  var section = $('.' + loc);
  $(section).stop().slideDown(function() {
    scrollToContent();
  });
};

function loadProjects() {
  _gaq.push(['_trackPageview', '/#projects']);
  $('section').stop().slideUp();
  var section = $('.resume');
  $(section).stop().slideDown(function() {
    $('html, body').animate({
      scrollTop: $("#projects").offset().top
    }, 200);
  });
};