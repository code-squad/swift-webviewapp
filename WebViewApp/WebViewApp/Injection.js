var main_popup = document.querySelector('.app-download-popup');
if (main_popup != null) {
    main_popup.style.display = 'none';
}
var event_popup = document.querySelector('.mobile_wm_popup');
if (event_popup != null) {
    event_popup.style.display = 'none';
}
var slide_navi = document.querySelector('.slide-navi');
if (slide_navi != null) {
    slide_navi.addEventListener('click', function(e) {
        var target = e.target
        callNative(target)
    }, true)
}
function callNative(target) {
    try {
        webkit.messageHandlers.clickEvent.postMessage({title: target.getAttribute('value'),
                                                    urlString: target.getAttribute('href')});
    } catch(err) {
        alert(err);
    }
}
