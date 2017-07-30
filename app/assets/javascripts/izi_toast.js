const  NOTICE_COLORS = {
  'success': 'green',
  'notice': 'blue',
  'warning': 'yellow',
  'error': 'red'
}
document.addEventListener('turbolinks:load', function() {
  var notices = $('.notice');
  $.each(notices, function(key, el){
    var type = $(el).data('type') || 'notice';
    var title = $(el).data('title') || I18n.t('notices.titles.' + type);
    var msg = $(el).data('message') || I18n.t('notices.' + type);
    iziToast.show({
      color: NOTICE_COLORS[type],
      title: title,
      message: msg,
      position: 'topRight'
    });
  });
});
