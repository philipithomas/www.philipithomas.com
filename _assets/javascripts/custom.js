$(document).ready(function(){    

  // 300ms delays fucking suck
  $(function() {
      FastClick.attach(document.body);
  });

  var snapper = new Snap({
      element: document.getElementById('main-wrapper'),
      hyperextensible: false,
      disable: 'left',
      touchToDrag: false, // Unfortunately there's a bug with flicking
  });
  $( window ).resize(function() {
    if ($( window ).width() >= 768) {
      snapper.close();
      snapper.disable();
    } else {
      snapper.enable();
    }
  });

  // handle toggle button
  $("#sidebar-toggle").click( function() {
    if(snapper.state().state=="right" ){
      snapper.close();
    } else {
      snapper.open('right');
    }
  });

  // Due to fixed position, make toggle disappear  
  snapper.on('open', function() {
      $('#sidebar-toggle').hide();
  });
  snapper.on('close', function() {
    // Animation to close takes 300ms
    // Need an animation to create the queue
    $('#sidebar-toggle').delay(160).fadeIn(5);
  });
});
