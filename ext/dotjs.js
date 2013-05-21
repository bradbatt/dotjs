$(function() {

  var baseURL = 'https://localhost:3131/';
  var host = window.location.host.replace('www.', '');

  var error_handler = function() {
    console.log('no dotjs server found at localhost:3131');
  };

  // Load the js.
  $.ajax({
    url: baseURL + host + '.js',
    dataType: 'text',
    success: function(d) { $(function() { eval(d); }); },
    error: error_handler
  });

  // Load the css.
  $.ajax({
    url: baseURL + host + '.css',
    dataType: 'text',
    success: function(d) {
      $(function() { $('<style></style>').text(d).appendTo($('head')); });
    },
    error: error_handler
  });
});
