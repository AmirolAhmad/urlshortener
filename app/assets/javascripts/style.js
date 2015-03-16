var ready;
ready = function() {

	$('.show-popup')
	  .popup({
	    inline   : true,
	    hoverable: true
	  })
	;

  $('.masthead .information')
    .transition('scale in', 1000)
  ;

  $('.message .close').on('click', function() {
	  $(this).closest('.message').fadeOut();
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);