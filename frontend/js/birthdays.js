// Load upcoming birthdays on page load
window.addEventListener('DOMContentLoaded', loadBirthdays);

function loadBirthdays() {
  const loading = document.getElementById('loading');
  const error = document.getElementById('error');
  const results = document.getElementById('results');

  loading.style.display = 'block';
  error.style.display = 'none';
  results.innerHTML = '';

  fetch('http://localhost:3000/api/members/upcoming-birthdays')
    .then(res => {
      if (!res.ok) throw new Error('Failed to fetch data');
      return res.json();
    })
    .then(data => {
      loading.style.display = 'none';
      if (data.length === 0) {
        results.innerHTML = '<p style="text-align:center; color:#666;">No upcoming birthdays in the next 30 days.</p>';
        return;
      }
      displayBirthdays(data);
    })
    .catch(err => {
      loading.style.display = 'none';
      error.style.display = 'block';
      error.textContent = 'Error loading data: ' + err.message;
    });
}

function displayBirthdays(data) {
  const results = document.getElementById('results');
  
  let html = '<table class="data-table"><thead><tr>';
  html += '<th>Member Name</th>';
  html += '<th>Date of Birth</th>';
  html += '<th>Days Until Birthday</th>';
  html += '<th>Phone</th>';
  html += '<th>Email</th>';
  html += '</tr></thead><tbody>';

  data.forEach(member => {
    const dob = new Date(member.Date_of_Birth).toLocaleDateString();
    html += '<tr>';
    html += `<td><strong>${member.Full_Name}</strong></td>`;
    html += `<td>${dob}</td>`;
    html += `<td><span class="badge badge-upcoming">${member.Days_Until_Birthday} days</span></td>`;
    html += `<td>${member.Phone}</td>`;
    html += `<td>${member.Email}</td>`;
    html += '</tr>';
  });

  html += '</tbody></table>';
  results.innerHTML = html;
}