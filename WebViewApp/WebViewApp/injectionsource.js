var popup = document.querySelector('.app-download-popup');
if (popup != null) {
    popup.style.display = 'none';
}

function callNative() {
    var slideNavi = document.querySelectorAll('ul.slide-navi > li > a');
    pos = []
    if (slideNavi != null) {
        for (var i = 0; i < slideNavi.length; i++) {
            var value = slideNavi[i];
            var valueTitle = value.textContent;
            var valueURL = value.getAttribute('href');
            pos.push({'valueTitle': valueTitle, 'valueURL': valueURL});
        }
        webkit.messageHandlers.slideMenu.postMessage(pos);
    }
}

callNative();

