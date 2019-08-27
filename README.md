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
![](/webview2-1.png)

- 전체 사이트 로딩 현황을 확인

![](/webview2-2.png)

- 사파리 Elements 탭에서 "최근 본 상품" 화면에 대한 div 태그를 찾아서 스타일을 바꿈

