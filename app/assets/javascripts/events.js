function showMiniProgressBar(miniAmountRaised, miniTargetAmount, eventID) {
    var minitargetbar = new TargetBar(miniAmountRaised, miniTargetAmount, eventID);
    var $event = $('[data-event-id=' + eventID + ']')

    var getPercent = (minitargetbar.percentage()) / 100;
    var getTargetWrapWidth = $('.mini-target-wrap').width();
    var progressTotal = getPercent * getTargetWrapWidth;
    var animationLength = 2500;

    // Display target amount
    $event.find('.mini-target-amount').text(minitargetbar.miniTargetAmount);
    // Display money raised so far
    $event.find('.money-raised').text(minitargetbar.amount);
    // Add current progress as a class to indicate colour of the bar
    $event.find('.mini-target-wrap').addClass(minitargetbar.progress())
    

    // on page load, animate percentage bar to current donation percentage
    // .stop() used to prevent animation queueing
    console.log($event.html());
    $event.find('.mini-target-bar').stop().animate({
        left: progressTotal
    }, animationLength);
}

$(document).ready(function(){

  if($('#event-page').length) {
    //gets the donation amount
    var url = document.URL + '/donations.json';
    $.get(url, function(data) {
      var amountRaised = "£" + data.donationTotal + " raised so far"
      var percentageRaised = data.donationPercentage + "% of fundraising target achieved."
      $('#amount-raised').text(amountRaised);
      $('.percentage-completion').text(percentageRaised);
    });

    var addAttribute = function(attributeId, type, label) {
      $(attributeId).attr(type, label);
    }

    var removeAttribute = function(attributeId, label){
      $(attributeId).removeAttr(label);
    }

    var removeClass = function(attributeClass, label) {
      $(attributeClass).removeClass(label);
    }

    var addClass = function(attributeClass, label) {
      $(attributeClass).addClass(label);
    }

    $('#2-workouts-label').on('click', function(){
      removeClass('.label-checked', 'label-checked');
      addClass('#2-workouts-label', 'label-checked');
      removeAttribute('input[type="radio"]', 'checked')
      addAttribute('#2-workouts', 'checked', 'checked');
    });

    $('#3-workouts-label').on('click', function(){
      removeClass('.label-checked', 'label-checked');
      addClass('#3-workouts-label', 'label-checked');
      removeAttribute('input[type="radio"]', 'checked');
      addAttribute('#3-workouts', 'checked', 'checked');
    });

    $('#4-workouts-label').on('click', function(){
      removeClass('.label-checked', 'label-checked');
      addClass('#4-workouts-label', 'label-checked');
      removeAttribute('input[type="radio"]', 'checked');
      addAttribute('#4-workouts', 'checked', 'checked');
    });

    $('#5-workouts-label').on('click', function(){
      removeClass('.label-checked', 'label-checked');
      addClass('#5-workouts-label', 'label-checked');
      removeAttribute('input[type="radio"]', 'checked');
      addAttribute('#5-workouts', 'checked', 'checked');
    });

    $('#6-workouts-label').on('click', function(){
      removeClass('.label-checked', 'label-checked');
      addClass('#6-workouts-label', 'label-checked');
      removeAttribute('input[type="radio"]', 'checked');
      addAttribute('#6-workouts', 'checked', 'checked');
    });

    function displayModal(e){
    e.preventDefault();
    $($(e.target).attr('data-modal-selector')).modal({
        fadeDuration: 500,
        fadeDelay: 0.30
    });
  }

    $(".modal-button").on('click', displayModal);
    $(".pledge-modal-button").on('click', displayModal);
    $(".new-post-modal-button").on('click', displayModal);
    $(".menu-modal-button").on('click', displayModal);
    $(".challenge-me-button").on('click', displayModal);


  moveProgressBar();
    $(window).resize(function() {
        moveProgressBar();
    });

    function moveProgressBar() {
        var targetbar = new TargetBar(amountRaised, targetAmount);

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
        

        // on page load, animate percentage bar to current donation percentage
        // .stop() used to prevent animation queueing
        $('.target-bar').stop().animate({
            left: progressTotal
        }, animationLength);
    }



    minimoveProgressBar();
    $(window).resize(function() {
        minimoveProgressBar();
    });
  }
});

