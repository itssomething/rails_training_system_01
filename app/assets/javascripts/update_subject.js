$(document).on('turbolinks:load', function() {
  $('.update-subject').on('click', function() {
    var subject_id = $(this).data('id');
    var status = $(this).val();

    $.ajax({
      method: 'PATCH',
      url: '/subjects/' + subject_id,
      data: {id: subject_id, subject: {status: status}},
      dataType: 'json',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
  });
});
