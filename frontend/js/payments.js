// Load payment summary on page load
window.addEventListener('DOMContentLoaded', loadPayments);

function loadPayments() {
  const loading = document.getElementById('loading');
  const error = document.getElementById('error');
  const results = document.getElementById('results');

  loading.style.display = 'block';
  error.style.display = 'none';
  results.innerHTML = '';

  fetch('http://localhost:3000/api/payments/summary-by-mode')
    .then(res => {
      if (!res.ok) throw new Error('Failed to fetch data');
      return res.json();
    })
    .then(data => {
      loading.style.display = 'none';
      if (data.length === 0) {
        results.innerHTML = '<p style="text-align:center; color:#666;">No payment data available.</p>';
        return;
      }
      displayPayments(data);
    })
    .catch(err => {
      loading.style.display = 'none';
      error.style.display = 'block';
      error.textContent = 'Error loading data: ' + err.message;
    });
}

function displayPayments(data) {
  const results = document.getElementById('results');
  
  // Calculate total revenue
  let totalRevenue = 0;
  data.forEach(item => {
    totalRevenue += parseFloat(item.Total_Amount);
  });

  // Display stats
  let html = '<div class="stats-grid">';
  html += `<div class="stat-card">`;
  html += `<h3>₹${totalRevenue.toLocaleString()}</h3>`;
  html += `<p>Total Revenue</p>`;
  html += `</div>`;
  
  data.forEach(item => {
    html += `<div class="stat-card">`;
    html += `<h3>₹${parseFloat(item.Total_Amount).toLocaleString()}</h3>`;
    html += `<p>${item.Payment_Mode}</p>`;
    html += `</div>`;
  });
  html += '</div>';

  // Display detailed table
  html += '<table class="data-table"><thead><tr>';
  html += '<th>Payment Mode</th>';
  html += '<th>Total Transactions</th>';
  html += '<th>Total Amount</th>';
  html += '<th>Average Amount</th>';
  html += '<th>Min Payment</th>';
  html += '<th>Max Payment</th>';
  html += '</tr></thead><tbody>';

  data.forEach(item => {
    html += '<tr>';
    html += `<td><strong>${item.Payment_Mode}</strong></td>`;
    html += `<td>${item.Total_Transactions}</td>`;
    html += `<td>₹${parseFloat(item.Total_Amount).toLocaleString()}</td>`;
    html += `<td>₹${parseFloat(item.Average_Amount).toLocaleString()}</td>`;
    html += `<td>₹${parseFloat(item.Minimum_Payment).toLocaleString()}</td>`;
    html += `<td>₹${parseFloat(item.Maximum_Payment).toLocaleString()}</td>`;
    html += '</tr>';
  });

  html += '</tbody></table>';
  results.innerHTML = html;
}