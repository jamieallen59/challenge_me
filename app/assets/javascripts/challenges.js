// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){
	
	$('.accept-challenge').on('click', function(){
		$('.challenge-display').removeClass('challenge-declined-highlighting');
		$('.challenge-display').addClass('challenge-accepted-highlighting');
		var challenge = $(this).parent().data('challenge');
		$.post("/challenge/" + challenge + "/accept", function(response){
			//refresh
		});
	});

	$('.decline-challenge').on('click', function(){
		$ ('.challenge-display').removeClass('challenge-accepted-highlighting');
		$('.challenge-display').addClass('challenge-declined-highlighting');
		var challenge = $(this).parent().data('challenge');
		$.post("/challenge/" + challenge + "/decline", function(response){
			//refresh
		});
	});
});
