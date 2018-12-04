var popup = document.querySelector('.app-download-popup');
if (popup != null) {
    popup.style.display = 'none';
}

var search = document.querySelector('.btn-search');
search.addEventListener('click', function(){ scriptHandler("searchBar"); });

var menubar = document.querySelector('.slide-navi');
menubar.addEventListener('click', function(){ scriptHandler("menuBar"); });

function scriptHandler(message) {
    event.preventDefault();
    try {
        webkit.messageHandlers.scriptHandler.postMessage(message);
    } catch(error) {
        alert(error);
    }
}
