// Load expired members on page load
window.addEventListener('DOMContentLoaded', loadExpiredMembers);

function loadExpiredMembers() {
  const loading = document.getElementById('loading');
  const error = document.getElementById('error');
  const results = document.getElementById('results');

  loading.style.display = 'block';
  error.style.display = 'none';
  results.innerHTML = '';

  fetch('http://localhost:3000/api/subscriptions/expired-members')
    .then(res => {
      if (!res.ok) throw new Error('Failed to fetch data');
      return res.json();
    })
    .then(data => {
      loading.style.display = 'none';
      if (data.length === 0) {
        results.innerHTML = '<p style="text-align:center; color:#666;">No expired memberships found.</p>';
        return;
      }
      displayExpiredMembers(data);
    })
    .catch(err => {
      loading.style.display = 'none';
      error.style.display = 'block';
      error.textContent = 'Error loading data: ' + err.message;
    });
}

function displayExpiredMembers(data) {
  const results = document.getElementById('results');
  
  // Separate by category
  const recent = data.filter(m => m.Expiry_Category === 'Recently Expired');
  const thisMonth = data.filter(m => m.Expiry_Category === 'Expired This Month');
  const longExpired = data.filter(m => m.Expiry_Category === 'Long Expired');

  let html = '';

  // Stats
  html += '<div class="stats-grid">';
  html += `<div class="stat-card" style="background: #ff9800;">`;
  html += `<h3>${recent.length}</h3>`;
  html += `<p>Recently Expired</p>`;
  html += `</div>`;
  html += `<div class="stat-card" style="background: #ff5722;">`;
  html += `<h3>${thisMonth.length}</h3>`;
  html += `<p>Expired This Month</p>`;
  html += `</div>`;
  html += `<div class="stat-card" style="background: #9e9e9e;">`;
  html += `<h3>${longExpired.length}</h3>`;
  html += `<p>Long Expired</p>`;
  html += `</div>`;
  html += `<div class="stat-card">`;
  html += `<h3>${data.length}</h3>`;
  html += `<p>Total Expired</p>`;
  html += `</div>`;
  html += '</div>';

  // Display by category
  if (recent.length > 0) {
    html += '<h3 style="margin: 30px 0 15px 0; color: #ff9800;">🔴 Recently Expired (Priority Follow-up)</h3>';
    html += generateMemberCards(recent);
  }

  if (thisMonth.length > 0) {
    html += '<h3 style="margin: 30px 0 15px 0; color: #ff5722;">⚠️ Expired This Month</h3>';
    html += generateMemberCards(thisMonth);
  }

  if (longExpired.length > 0) {
    html += '<h3 style="margin: 30px 0 15px 0; color: #9e9e9e;">📋 Long Expired</h3>';
    html += generateMemberCards(longExpired);
  }

  results.innerHTML = html;
}

function generateMemberCards(members) {
  let html = '';
  
  members.forEach(member => {
    const startDate = new Date(member.Start_Date).toLocaleDateString();
    const endDate = new Date(member.End_Date).toLocaleDateString();
    const categoryClass = member.Expiry_Category === 'Recently Expired' ? 'badge-recent' : 'badge-expired';

    html += '<div class="member-card">';
    html += `<h4>👤 ${member.Member_Name}</h4>`;
    html += '<div class="member-info">';
    html += `<div><strong>Phone:</strong> ${member.Phone}</div>`;
    html += `<div><strong>Email:</strong> ${member.Email}</div>`;
    html += `<div><strong>Subscription:</strong> ${member.Subscription_Type}</div>`;
    html += `<div><strong>Price:</strong> ₹${parseFloat(member.Price).toLocaleString()}</div>`;
    html += `<div><strong>Start Date:</strong> ${startDate}</div>`;
    html += `<div><strong>End Date:</strong> ${endDate}</div>`;
    html += `<div><strong>Days Expired:</strong> <span class="badge ${categoryClass}">${member.Days_Expired} days</span></div>`;
    html += `<div><strong>Category:</strong> ${member.Expiry_Category}</div>`;
    html += '</div>';
    html += '</div>';
  });

  return html;
}