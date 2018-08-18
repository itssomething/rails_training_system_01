$(document).on('turbolinks:load', function() {
  $('.update-user-subject').on('click', function() {
    var user_subject_id = $(this).data('id');
    var status = $(this).val();

    $.ajax({
      method: 'PATCH',
      url: '/user_subjects/' + user_subject_id,
      data: {id: user_subject_id, user_subject: {status: status}},
      dataType: 'json',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
  });
});
