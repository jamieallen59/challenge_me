$(document).ready(function(){

	var $pro = $('#bar');
	// var Color = function(){
	// var r = function(){
	// return Math.floor(Math.random() * 360)};
	// return 'hsla('+r()+',50%, 50%, .8)';};
	$pro.css({ });
	// 0%


});


function moveProgressBar() {
    var targetbar = new TargetBar(amountRaised, targetAmount);
    var getPercent = (targetbar.percentage()) / 100;
    var getTargetWrapWidth = $('#bar').width();
    var progressTotal = getPercent * getTargetWrapWidth;
    var animationLength = 1500;

    // Display target amount
    $('.target-amount').text(targetbar.targetAmount);
    // Display money raised so far
    $('.money-raised').text(targetbar.amount);
    // Add current progress as a class to indicate colour of the bar
    $('.target-wrap').addClass(targetbar.progress())


    // on page load, animate percentage bar to current donation percentage
    // .stop() used to prevent animation queueing
    $('#bar').stop().animate({
        left: progressTotal
    }, animationLength);
}