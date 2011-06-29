$(function() {
  ResizingBackground.init();
});

var ResizingBackground = function() {

	var BASE_WIDTH = 1000;
	var BASE_HEIGHT = 667;
	var WIDTH_FROM_HEIGHT = BASE_WIDTH / BASE_HEIGHT;
	var HEIGHT_FROM_WIDTH = BASE_HEIGHT / BASE_WIDTH;
	
  return {    
    init: function() {
      $(window).resize(this.resize_background);
      this.resize_background();
    },
    
    resize_background: function() {
			var current_width_ratio = $(window).width() / $(window).height();
			if (current_width_ratio > WIDTH_FROM_HEIGHT) {
				$('.background img').css({ width : $(window).width(), height : $(window).width() * HEIGHT_FROM_WIDTH });
			} else {
				$('.background img').css({ height : $(window).height(), width : $(window).height() * WIDTH_FROM_HEIGHT });
			}
    }
  }
}();