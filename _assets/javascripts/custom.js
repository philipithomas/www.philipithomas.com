$(document).ready(function(){    
  
  // 300ms delays fucking suck
  $(function() {
      FastClick.attach(document.body);
  });

  var snapper = new Snap({
      element: document.getElementById('main-wrapper'),
      hyperextensible: false,
      disable: 'left',
  });
  $( window ).resize(function() {
    if ($( window ).width() >= 768) {
      snapper.close();
      snapper.disable();
    } else {
      snapper.enable();
    }
  });

  $("#sidebar-toggle").click( function() {
    if( snapper.state().state=="right" ){
      snapper.close();
    } else {
      snapper.open('right');
    }
  });
});
