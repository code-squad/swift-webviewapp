# swift-webviewapp

## 2019.08.27 13:23
![](/webview1.png)

- 웹페이지가 보이도록 구현

1. 처음 앱을 실행시키면 webView(_:shouldStartLoadWith:navigationType:) 메소드가 실행
2. 바로 페이지가 로드되기 시작하면 webViewDidStartLoad(_:) 메소드가 실행
3. 로드가 완료면 webViewDidFinishLoad(_:) 메소드가 실행

추가 페이지가 있다면 위에 1~3이 반복되며 로드된다.

### webView(_:shouldStartLoadWith:navigationType:) 메소드의 매개변수
- request
https://m.shopping.naver.com/
▿ url: Optional(https://m.shopping.naver.com/)
▿ some: https://m.shopping.naver.com/
  _url: https://m.shopping.naver.com/ #0
  super: NSObject
  cachePolicy: 0
  timeoutInterval: 60.0
▿ mainDocumentURL: Optional(https://m.shopping.naver.com/)
▿ some: https://m.shopping.naver.com/
  _url: https://m.shopping.naver.com/ #1
  super: NSObject
  networkServiceType: __C.NSURLRequestNetworkServiceType
  allowsCellularAccess: true
▿ httpMethod: Optional("GET")
  some: "GET"
▿ allHTTPHeaderFields: Optional(["User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 12_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148", "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"])
▿ some: 2 key/value pairs
▿ (2 elements)
  key: "User-Agent"
  value: "Mozilla/5.0 (iPhone; CPU iPhone OS 12_4 like Mac OS X). AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148"
▿ (2 elements)
  key: "Accept"
  value: "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
  httpBody: nil
  httpBodyStream: nil
  httpShouldHandleCookies: true
  httpShouldUsePipelining: true

- navigationType
__C.UIWebViewNavigationType

## 2019.08.27 16:03

- UIWebView 를 WKWebView 으로 변경

![](/webview2-1.png)

- 전체 사이트 로딩 현황을 확인

![](/webview2-2.png)

- 사파리 Elements 탭에서 "최근 본 상품" 화면에 대한 div 태그를 찾아서 스타일을 바꿈

## 2019.08.27 16:03
![](/webview3.png)

- WKUserScript 와 evaluateJavaScript 을 이용해 자바스크립트를 실행시켜서 part_banner 제거
 
 ## 2019.09.03 13:29
  
 ![](/webview3-1.png)
 
 - 메뉴 버튼 클릭 시 사파리 뷰컨트롤러로 뷰 띄우도록 적용
 
 ![](/webview3-2.png)
 
 - javascript 를 이용해서 최상위 메뉴의 이름과 url 을 가져와서 로그 출력

받아온 메뉴 정보
▿ WebviewApp.Menus
▿ menus: 18 elements
▿ WebviewApp.Menu
- text: "아울렛윈도"
- urlString: "https://m.shopping.naver.com/outlet/home"
▿ WebviewApp.Menu
- text: "스타일윈도"
- urlString: "https://m.shopping.naver.com/style/style/home"
▿ WebviewApp.Menu
- text: "디자이너윈도"
- urlString: "https://m.swindow.naver.com/designer/home"
▿ WebviewApp.Menu
- text: "뷰티윈도"
- urlString: "https://m.swindow.naver.com/beauty/home"
▿ WebviewApp.Menu
- text: "리빙윈도"
- urlString: "https://m.shopping.naver.com/living"
▿ WebviewApp.Menu
- text: "푸드윈도"
- urlString: "https://m.shopping.naver.com/fresh"
▿ WebviewApp.Menu
- text: "키즈윈도"
- urlString: "https://m.swindow.naver.com/kids/home"
▿ WebviewApp.Menu
- text: "펫윈도"
- urlString: "https://m.swindow.naver.com/pet/home"
▿ WebviewApp.Menu
- text: "플레이윈도"
- urlString: "https://m.swindow.naver.com/play/home"
▿ WebviewApp.Menu
- text: "아트윈도"
- urlString: "https://m.shopping.naver.com/art/home"
▿ WebviewApp.Menu
- text: "핫딜"
- urlString: "https://m.shopping.naver.com/hotdeal/m/index.nhn"
▿ WebviewApp.Menu
- text: "선물"
- urlString: "https://m.shopping.naver.com/gift/home"
▿ WebviewApp.Menu
- text: "해외직구"
- urlString: "https://m.swindow.naver.com/foreign/home"
▿ WebviewApp.Menu
- text: "toptop"
- urlString: "https://toptop.naver.com/"
▿ WebviewApp.Menu
- text: "기획전"
- urlString: "https://m.shopping.naver.com/plan2/m/index.nhn"
▿ WebviewApp.Menu
- text: "BEST"
- urlString: "https://m.shopping.naver.com/best/home"
▿ WebviewApp.Menu
- text: "셀렉티브"
- urlString: "https://selective.naver.com/discover?shp"
▿ WebviewApp.Menu
- text: "Aitems"
- urlString: "https://m.shopping.naver.com/aitems"
