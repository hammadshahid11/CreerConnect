// job_seeker.js

// Function to open the edit profile modal
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
    console.log ("hi");
        $.ajax({
      url: '<%= j(new_job_seeker_path) %>',
      method: 'GET',
      success: function(response) {
      
        $('#createJobSeekerModal .modal-content').html(response);
            $('#createJobSeekerModal').modal('show');
      },
      error: function() {
        alert('Error loading the form. Please try again.');
      }
    });
  });