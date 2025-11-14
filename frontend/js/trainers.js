// Load trainer workload when button is clicked
function loadTrainerWorkload() {
  const loading = document.getElementById('loading');
  const error = document.getElementById('error');
  const results = document.getElementById('results');
  const date = document.getElementById('workloadDate').value;

  if (!date) {
    error.style.display = 'block';
    error.textContent = 'Please select a date';
    return;
  }

  loading.style.display = 'block';
  error.style.display = 'none';
  results.innerHTML = '';

  fetch(`http://localhost:3000/api/sessions/trainer-workload/${date}`)
    .then(res => {
      if (!res.ok) throw new Error('Failed to fetch data');
      return res.json();
    })
    .then(data => {
      loading.style.display = 'none';
      if (data.length === 0) {
        results.innerHTML = `<p style="text-align:center; color:#666;">No trainers with more than 2 sessions on ${date}.</p>`;
        return;
      }
      displayTrainers(data, date);
    })
    .catch(err => {
      loading.style.display = 'none';
      error.style.display = 'block';
      error.textContent = 'Error loading data: ' + err.message;
    });
}

function displayTrainers(data, date) {
  const results = document.getElementById('results');
  
  let html = `<h3 style="margin-bottom: 20px;">Trainers with High Workload on ${new Date(date).toLocaleDateString()}</h3>`;

  data.forEach(trainer => {
    html += '<div class="member-card">';
    html += `<h4>🏋️ ${trainer.Trainer_Name}</h4>`;
    html += '<div class="member-info">';
    html += `<div><strong>Specialization:</strong> ${trainer.Specialization}</div>`;
    html += `<div><strong>Total Sessions:</strong> <span class="badge badge-urgent">${trainer.Total_Sessions}</span></div>`;
    html += `<div><strong>Session Types:</strong> ${trainer.Session_Types}</div>`;
    html += `<div><strong>Rooms Used:</strong> ${trainer.Rooms_Used}</div>`;
    html += `<div><strong>First Session:</strong> ${trainer.First_Session}</div>`;
    html += `<div><strong>Last Session:</strong> ${trainer.Last_Session}</div>`;
    html += '</div>';
    html += '</div>';
  });

  results.innerHTML = html;
}

// Auto-load on page load with default date
window.addEventListener('DOMContentLoaded', loadTrainerWorkload);