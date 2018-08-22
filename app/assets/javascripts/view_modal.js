$(document).on('turbolinks:load', function() {
  $('.btn-modal-view-report').on('click', function() {
    var report_id = jQuery(this).data('id');
    jQuery.ajax({
      method: 'GET',
      url: '/view_details/' + report_id,
      data: {id: report_id},
      dataType: 'json',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(response) {
        $('#modal-window-view-report').modal('show');
        $('#response_report').html(response.html);
      }
    });
  });
});

$(document).on('turbolinks:load', function() {
  $('.close-modal-view-report').on('click', function() {
    $('#modal-window-view-report').hide();
  });
});
