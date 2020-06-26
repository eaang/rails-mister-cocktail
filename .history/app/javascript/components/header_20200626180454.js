//scroll to top on page refresh (PART1)
window.onbeforeunload = function () {
  window.scrollTo(0, 0);
}//for arrow click part (PART2)
$(document).ready( function () {
 $('#down').on('click',function () {
  $("html").scrollTop(0);   $('html, body').animate({
     scrollTop: $(where-you-want-to-scroll).offset().top
 }, 1000);
 });
});