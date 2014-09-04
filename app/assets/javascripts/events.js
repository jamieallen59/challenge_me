$(document).ready(function(){

  //gets the donation amount
  var url = document.URL + 'donations.json';
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


  $(".modal-button").on('click', function(){
      $('#ex1').modal({
          fadeDuration: 500,
          fadeDelay: 0.30
      });
      return false;
  });
});