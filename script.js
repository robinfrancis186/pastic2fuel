document.addEventListener('DOMContentLoaded', function() {
    // Navigation
    const navLinks = document.querySelectorAll('.nav-links a');
    const sections = document.querySelectorAll('.section');

    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = link.getAttribute('href').substring(1);
            
            // Update active states
            navLinks.forEach(link => link.parentElement.classList.remove('active'));
            link.parentElement.classList.add('active');
            
            // Show target section
            sections.forEach(section => {
                section.classList.remove('active');
                if (section.id === targetId) {
                    section.classList.add('active');
                }
            });
        });
    });

    // Form submission
    const submissionForm = document.querySelector('.submission-form form');
    if (submissionForm) {
        submissionForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(submissionForm);
            const data = Object.fromEntries(formData.entries());
            
            // Simulate submission
            alert('Submission successful! Your plastic waste has been recorded.');
            submissionForm.reset();
        });
    }

    // Reward redemption
    const redeemButtons = document.querySelectorAll('.reward-card .btn-secondary');
    redeemButtons.forEach(button => {
        button.addEventListener('click', () => {
            const rewardName = button.parentElement.querySelector('h3').textContent;
            const credits = button.parentElement.querySelector('p').textContent;
            
            if (confirm(`Are you sure you want to redeem ${rewardName} for ${credits}?`)) {
                alert('Reward redeemed successfully!');
            }
        });
    });

    // Admin approval system
    const approvalList = document.querySelector('.approval-list');
    if (approvalList) {
        // Simulate pending approvals
        const pendingApprovals = [
            { id: 1, user: 'John Doe', type: 'Type 2 Plastic', quantity: '5kg' },
            { id: 2, user: 'Jane Smith', type: 'Type 1 Plastic', quantity: '3kg' }
        ];

        // Render pending approvals
        pendingApprovals.forEach(approval => {
            const approvalItem = document.createElement('div');
            approvalItem.className = 'approval-item';
            approvalItem.innerHTML = `
                <div class="approval-details">
                    <h4>${approval.user}</h4>
                    <p>${approval.type} - ${approval.quantity}</p>
                </div>
                <div class="approval-actions">
                    <button class="btn-primary approve-btn" data-id="${approval.id}">Approve</button>
                    <button class="btn-secondary reject-btn" data-id="${approval.id}">Reject</button>
                </div>
            `;
            approvalList.appendChild(approvalItem);
        });

        // Handle approval actions
        approvalList.addEventListener('click', (e) => {
            if (e.target.matches('.approve-btn, .reject-btn')) {
                const action = e.target.classList.contains('approve-btn') ? 'approved' : 'rejected';
                const id = e.target.dataset.id;
                alert(`Submission ${id} has been ${action}`);
                e.target.closest('.approval-item').remove();
            }
        });
    }

    // Performance metrics simulation
    const performanceMetrics = document.querySelector('.performance-metrics');
    if (performanceMetrics) {
        performanceMetrics.innerHTML = `
            <div class="metric">
                <h4>Processing Rate</h4>
                <p>95%</p>
                <div class="progress-bar">
                    <div class="progress" style="width: 95%"></div>
                </div>
            </div>
            <div class="metric">
                <h4>Machine Temperature</h4>
                <p>Normal</p>
                <div class="status-indicator active">
                    <span class="dot"></span>
                    Operating within limits
                </div>
            </div>
        `;
    }
}); 