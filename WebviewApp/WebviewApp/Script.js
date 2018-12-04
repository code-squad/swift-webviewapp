var popup = document.querySelector('.app-download-popup');
if (popup != null) {
    popup.style.display = 'none';
}

var search = document.querySelector('.btn-search');
search.addEventListener('click', function(){ scriptHandler("searchBar"); });

var menubar = document.querySelector('.slide-navi');
menubar.addEventListener('click', function(){ scriptHandler("menuBar"); });

function scriptHandler(message) {
    if (message == "searchBar") {
        event.preventDefault();
        
        try {
            webkit.messageHandlers.scriptHandler.postMessage(message);
        } catch(error) {
            alert(error);
        }
    }
    
    if (message == "menuBar") {
        var menu = document.querySelectorAll('.slide-navi > li > a');
        var data = [];
        for (var i = 0; i < menu.length; i++) {
            data.push({'title': menu[i].innerHTML, 'url': menu[i].getAttribute('href')});
        }
        console.log(data);
        try {
            webkit.messageHandlers.scriptHandler.postMessage(data);
        } catch(error) {
            alert(error);
        }
    }
}
