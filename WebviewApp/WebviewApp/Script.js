var popup = document.querySelector('.app-download-popup');
if (popup != null) {
    popup.style.display = 'none';
}

var search = document.querySelector('.btn-search');
search.addEventListener('click', changeSearch );

function changeSearch() {
    event.preventDefault();
    try {
    webkit.messageHandlers.scriptHandler.postMessage("searchBar");
    } catch(error) {
        alert(error);
    }
}
