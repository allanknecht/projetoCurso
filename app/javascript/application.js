// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";  // Importa o Turbo

// Reinicia os componentes do Bootstrap após a navegação com Turbo
document.addEventListener("turbo:load", function() {
    var dropdowns = document.querySelectorAll('.dropdown-toggle');
    dropdowns.forEach(function(dropdown) {
      new bootstrap.Dropdown(dropdown);  // Recria o dropdown usando o Bootstrap
    });
});
