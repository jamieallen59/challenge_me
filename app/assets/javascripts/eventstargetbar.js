$(document).ready(function(){

moveProgressBar();
        $(window).resize(function() {
            moveProgressBar();
        });

        function moveProgressBar() {
            var targetbar = new TargetBar(200, 500);

            var getPercent = (targetbar.percentage()) / 100;
            var getTargetWrapWidth = $('.target-wrap').width();
            var progressTotal = getPercent * getTargetWrapWidth;
            var animationLength = 2500;

            // Display target amount
            $('.target-amount').text(targetbar.targetAmount);
            // Display money raised so far
            $('.money-raised').text(targetbar.amount);
            // Add current progress as a class to indicate colour of the bar
            $('.target-wrap').addClass(targetbar.progress())
            
            $('.increase-donation').on('click', function() {
                targetbar.addMoney(10);
                // Update amount
                $('.money-raised').text(targetbar.amount);
                // Update class to change colour of bar
                $('.target-wrap').attr('class', 'target-wrap progress').addClass(targetbar.progress())
                // Update position of bar
                $('.target-bar').animate({
                    left: '+=2%'
                }, 300);
            });

            $('.decrease-donation').on('click', function() {
                targetbar.subtractMoney(10);
                $('.money-raised').text(targetbar.amount);
                $('.target-wrap').attr('class', 'target-wrap progress').addClass(targetbar.progress())
                $('.target-bar').animate({
                    left: '-=2%'
                }, 300);
            });

            // on page load, animate percentage bar to current donation percentage
            // .stop() used to prevent animation queueing
            $('.target-bar').stop().animate({
                left: progressTotal
            }, animationLength);
        }
