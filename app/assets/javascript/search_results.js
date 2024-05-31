$(document).ready(function() {
  $('#search-form').submit(function (e) {
    e.preventDefault();
    var formData = $(this).serialize();

    $.ajax({
      url: $(this).attr('action'),
      type: 'GET',
      data: formData,
      dataType: 'html',
      success: function (data) {
        $('#search-results').html(data); 
      },
      error: function (xhr, status, error) {
      },
    });
  });
});
