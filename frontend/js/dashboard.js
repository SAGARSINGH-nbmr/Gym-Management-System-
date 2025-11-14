// Dashboard initialization
window.addEventListener('DOMContentLoaded', function() {
  console.log('Gym Management System Dashboard Loaded');
  
  // Add hover effects
  const cards = document.querySelectorAll('.dashboard-card');
  cards.forEach(card => {
    card.addEventListener('mouseenter', function() {
      this.style.transform = 'translateY(-10px) scale(1.02)';
    });
    card.addEventListener('mouseleave', function() {
      this.style.transform = 'translateY(0) scale(1)';
    });
  });
});
