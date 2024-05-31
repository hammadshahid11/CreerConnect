const bioTextarea = document.getElementById('bio-textarea');
const charCount = document.getElementById('char-count');

bioTextarea.addEventListener('input', function() {
  const chars = this.value.length;
  charCount.textContent = chars;
});
