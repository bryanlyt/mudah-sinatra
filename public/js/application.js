$(document).ready(function(){

	$('#header-navbar li').hover(
		function(){ $(this).addClass("active"); },
		function(){ $(this).removeClass("active"); }
		);


  $('.nav-pills li:nth-child(1)').hover(
    function(){ 
      $(this).addClass("active"); 
      $('.nav-pills li:nth-child(2)').removeClass("active");
    });

  $('.nav-pills li:nth-child(2)').hover(
    function(){ 
      $(this).addClass("active"); 
      $('.nav-pills li:nth-child(1)').removeClass("active");
    });

	$('#myquestions').on('click hover', function () {
		var link      = window.location.href + "/questions";
      	$.ajax({
		    url: link,
		    method: "GET",
		    success: function(response){
		    	$html = $.parseHTML( response )
		    	$('.profile-content').html($html)
		    }
		});
		return false;
	});

	$('#myanswers').on('click hover', function () {
		var link      = window.location.href + "/answers";
      	$.ajax({
		    url: link,
		    method: "GET",
		    success: function(response){
		    	$html = $.parseHTML( response )
		    	$('.profile-content').html($html)
		    }
		});
		return false;
	});

	$('#logout').click(function(){
      	$.ajax({
		    url: "/session/logout",
		    method: "DELETE",
		    cache: false,
		    success: function(){
		    	window.location.href = '/';
		    }
		});
	});

  $('.newanswer').submit(function(e){
    e.preventDefault();
    console.log($(this).serialize())
    $.ajax({
      type: "POST",
      url: $(this).attr("action"),
      data: $(this).serialize(),
      success: function(){
        location.reload();
      },
      error: function() {
        loginBox()
      }
    });
  });
});
