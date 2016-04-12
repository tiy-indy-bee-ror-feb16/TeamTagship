jQuery(document).ready(function($) {

  function remainingChars() {
    var remaining = 170 - $('#ship_body').val().length;
    $('.countdown').text(remaining + ' characters remaining.');
    remaining <= 0 ? $('.countdown').css({ 'color': 'red', 'font-size': '150%' }) : $('.countdown').css({ 'color': 'black', 'font-size': '100%' })
    // if (remaining <= 0) {
    //   $('.countdown').css({'color': 'red'})
    // }

  }
  remainingChars();
  $('#ship_body').change(remainingChars);
  $('#ship_body').keyup(remainingChars);
});
