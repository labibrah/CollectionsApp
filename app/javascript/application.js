// Entry point for the build script in your package.json
import "popper"

import "bootstrap"

// Add this JavaScript to your view or assets/javascripts/application.js file
$(document).ready(function() {
    // Toggle Dark Mode
    $('#dark-mode-toggle').click(function() {
      // Perform AJAX request to toggle dark mode
      $.ajax({
        url: '/toggle_dark_mode',
        type: 'POST',
        success: function(response) {
          // Reload the page to apply the new mode
          location.reload();
        },
        error: function(xhr, status, error) {
          console.error(error);
        }
      });
    });
  });