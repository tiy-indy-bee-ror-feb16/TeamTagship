jQuery(document).ready(function($) {

  function remainingChars() {
    var remaining = 170 - $('#ship_body').val().length;
    $('.countdown').text(remaining + ' characters remaining.');
    remaining <= 0 ? $('.countdown').css({ 'color': 'red', 'font-size': '150%' }) : $('.countdown').css({ 'color': 'black', 'font-size': '100%' })
    return remaining
  }

  $("#new_ship").submit(function(event) {
    if (remainingChars() <= 0) {
      event.preventDefault();
      alert("That ship is too full to disembark!");
    }
  });

  remainingChars();
  $('#ship_body').change(remainingChars);
  $('#ship_body').keyup(remainingChars);
});
