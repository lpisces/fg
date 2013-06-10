$(function() {
  $("#played li").mouseover(function() {
    $('#played li').removeClass('active');
    $(this).addClass('active');
    $('#played .block').hide();
    $('#played .' + $(this).attr('data-block')).show();
  });
 });
