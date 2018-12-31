(function() {
  $(function() {
    $(document).on('ajax:success', '.delete', function(event, data, status, xhr) {
      var id = data['id'];
      $('#' + id).remove();
    });
  });
}).call(this);

(function() {
  $(function() {
    $(document).on('ajax:success', '.new_comment', function(event, data, status, xhr) {
      $('.comment').prepend(
        "<div class=\"message__comments--new\" id=" + data['id'] + ">" + data['comment'] + "</div>"
      );
      $("textarea").val("");
    });
  });
}).call(this);
