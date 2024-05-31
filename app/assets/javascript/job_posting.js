const jobDescriptionTextarea = document.getElementById('job-description-textarea');
const charCount = document.getElementById('char-count');

jobDescriptionTextarea.addEventListener('input', function() {
  const chars = this.value.length;
  charCount.textContent = chars;
});
