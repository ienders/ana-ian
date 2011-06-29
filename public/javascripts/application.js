$(function() {
  Application.init();
});

var Application = function() {

  return {
    init: function() {
      this.cufonize();
    },
    
    cufonize: function() {
      Cufon.replace(['h1, .headers span, .footer p'], { fontFamily: 'Jefferson', hover: false });
      Cufon.replace(['h2, .wedding_details p, .wedding_details a, .rsvp p, .footer span, label'], { fontFamily: 'Old Rubber Stamp', hover: true });
      Cufon.now();
    }
  }  
}();
