$(function() {
  Application.init();
});

var Application = function() {

  return {
    init: function() {
      this.cufonize();
      $('#new_rsvp').live('ajax:error', this.rsvp_error);
      $('#new_rsvp').live('ajax:success', this.rsvp_success);
    },
    
    cufonize: function() {
      Cufon.replace(['h1, .headers span, .footer p'], { fontFamily: 'Jefferson', hover: false });
      Cufon.replace(['h2, .wedding_details p, .wedding_details a, .rsvp p, .footer span, label'], { fontFamily: 'Old Rubber Stamp', hover: true });
      Cufon.now();
    },

    rsvp_success: function(event, data, status, xhr) {
      $('#rsvp_error').hide();
      $('#rsvp_success').show();
      Application.cufonize();
    },
    
    rsvp_error: function(event, data, status, xhr) {
      $('#rsvp_success').hide();
      $('#rsvp_error').html(data.responseText);
      $('#rsvp_error').show();
      Application.cufonize();
    }

  }  
}();
