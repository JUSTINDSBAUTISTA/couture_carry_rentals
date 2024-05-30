document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('searchForm').addEventListener('submit', function(event) {
        event.preventDefault();
        let searchQuery = document.getElementById('searchInput').value.trim();
        if (searchQuery !== '') {
            // Your search logic here, for example:
            // Perform search and display results
            alert('Search query: ' + searchQuery);
        } else {
            alert('Please enter a search query.');
        }
    });
});
