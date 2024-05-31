$('#editProfileLink').on('click', function() {
  $.ajax({
    url: '/job_seekers/edit',
    method: 'GET',
    success: function(response) {
      $('#jobSeekerModal .modal-content').html(response);
      $('#jobSeekerModal').modal('show');
    }
  });
});

$('#createJobSeekerLink').on('click', function() {
  $.ajax({
    url: '<%= j(new_job_seeker_path) %>',
    method: 'GET',
    success: function(response) {
      $('#createJobSeekerModal .modal-content').html(response);
      $('#createJobSeekerModal').modal('show');
    },
    error: function() {
    }
  });
});


const bioTextarea = document.getElementById('bio-textarea');
const charCount = document.getElementById('char-count');

bioTextarea.addEventListener('input', function() {
  const chars = this.value.length;
  charCount.textContent = chars;
});
