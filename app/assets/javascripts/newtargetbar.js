$(document).ready(function(){

	var $pro = $('#bar');
	var Color = function(){
	var r = function(){
	return Math.floor(Math.random() * 360)};
	return 'hsla('+r()+',50%, 50%, .8)';};
	$pro.css({ backgroundColor:Color });
	// 0%

	// $('#bar_000').on('click',function(){
	// 	console.log('yo');
	// });

	// $('#bar_000 span').on('click',function(){
	//   $pro.stop().animate({ width:'0%' }, 150);
	// });
	// // 25%
	// $('#bar_025 span').on('click',function(){
	// 	console.log('yo');
	//   $pro.stop().animate({ width:'25%' }, 150);
	// });
	// // 50%
	// $('#bar_050 span').on('click',function(){
	//   $pro.stop().animate({ width:'50%' }, 150);
	// });
	// // 75%
	// $('#bar_075 span').on('click',function(){
	//   $pro.stop().animate({ width:'75%' }, 150);
	// });
	// // 100%
	// $('#bar_100 span').on('click',function(){
	//   $pro.stop().animate({ width:'100%' }, 150);
	// });
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