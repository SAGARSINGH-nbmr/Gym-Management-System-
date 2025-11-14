// Load equipment maintenance alerts on page load
window.addEventListener('DOMContentLoaded', loadEquipment);

function loadEquipment() {
  const loading = document.getElementById('loading');
  const error = document.getElementById('error');
  const results = document.getElementById('results');

  loading.style.display = 'block';
  error.style.display = 'none';
  results.innerHTML = '';

  fetch('http://localhost:3000/api/equipment/maintenance-alert')
    .then(res => {
      if (!res.ok) throw new Error('Failed to fetch data');
      return res.json();
    })
    .then(data => {
      loading.style.display = 'none';
      if (data.length === 0) {
        results.innerHTML = '<p style="text-align:center; color:#666;">No equipment requires maintenance in the next 7 days.</p>';
        return;
      }
      displayEquipment(data);
    })
    .catch(err => {
      loading.style.display = 'none';
      error.style.display = 'block';
      error.textContent = 'Error loading data: ' + err.message;
    });
}

function displayEquipment(data) {
  const results = document.getElementById('results');
  
  // Separate by priority
  const urgent = data.filter(e => e.Priority === 'URGENT');
  const upcoming = data.filter(e => e.Priority === 'UPCOMING');

  let html = '';

  // Stats
  html += '<div class="stats-grid">';
  html += `<div class="stat-card" style="background: #ff5252;">`;
  html += `<h3>${urgent.length}</h3>`;
  html += `<p>Urgent Maintenance</p>`;
  html += `</div>`;
  html += `<div class="stat-card" style="background: #ffa726;">`;
  html += `<h3>${upcoming.length}</h3>`;
  html += `<p>Upcoming Maintenance</p>`;
  html += `</div>`;
  html += `<div class="stat-card" style="background: #4CAF50;">`;
  html += `<h3>${data.length}</h3>`;
  html += `<p>Total Items</p>`;
  html += `</div>`;
  html += '</div>';

  // Table
  html += '<table class="data-table"><thead><tr>';
  html += '<th>Equipment Name</th>';
  html += '<th>Type</th>';
  html += '<th>Status</th>';
  html += '<th>Last Service</th>';
  html += '<th>Next Service</th>';
  html += '<th>Days Remaining</th>';
  html += '<th>Priority</th>';
  html += '</tr></thead><tbody>';

  data.forEach(equipment => {
    const lastService = new Date(equipment.Last_Service_Date).toLocaleDateString();
    const nextService = new Date(equipment.Next_Service_Date).toLocaleDateString();
    const priorityClass = equipment.Priority === 'URGENT' ? 'badge-urgent' : 'badge-upcoming';

    html += '<tr>';
    html += `<td><strong>${equipment.Equipment_Name}</strong></td>`;
    html += `<td>${equipment.Equipment_Type}</td>`;
    html += `<td>${equipment.Condition_Status}</td>`;
    html += `<td>${lastService}</td>`;
    html += `<td>${nextService}</td>`;
    html += `<td><strong>${equipment.Days_Remaining} days</strong></td>`;
    html += `<td><span class="badge ${priorityClass}">${equipment.Priority}</span></td>`;
    html += '</tr>';
  });

  html += '</tbody></table>';
  results.innerHTML = html;
}