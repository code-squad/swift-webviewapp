# swift-webviewapp
레벨3 웹 기반 앱

## step-01. 웹뷰

### 배운내용

#### **UIWebViewDelegate**에 대해 배웠다.

1. `webView(_:shouldStartLoadWith:navigationType:) -> Bool` (optional) : 웹뷰가 loading하기 전에 호출됩니다. (`navigationType`에 관련해서는 아래 표를 참조)
2. `webViewDidStartLoad(_:)` (optional) : 웹뷰가 loading을 시작했을때 호출됩니다.
3. `webViewDidFinishLoad(_:)` (optional) : 웹뷰가 loading을 완료했을때 호출됩니다.
4. `webView(_:didFailLoadWithError:)` (optional) : 웹뷰가 load를 실패했을때 호출됩니다.

| NavigationType 종류 | 설명 |
|---|---|
|linkClicked|User tapped a link.|
|formSubmitted|User submitted a form.|
|backForward|User tapped the back or forward button.|
|reload|User tapped the reload button.|
|formResubmitted|User resubmitted a form.|
|other|Some other action occurred.|


#### **WKWebView** 와 **UIWebView**의 차이점에 대해 배웠다.

> WKWebView의 장점

##### 1. 앱의 기본 프로세스 외부에서 실행됩니다.

**WKWebView**는 프로세스를 벗어나서 실행됩니다. (메모리가 앱과 별도로 스레드)   
할당량을 초과하면 앱을 중단하지 않고 충돌합니다. (이 경우 앱에 알림을 전송하고 페이지 로드를 재시도합니다.)

대조적으로 **UIWebView**는 프로세스 내에서 실행됩니다. iOS에서 할당하려는 값을 초과하면 앱 자체가 운영 체제에 의해 손상됩니다. 이런 일이 발생하기 전에 iOS로부터 알림을받는 경우가 종종 있지만 충돌을 막을 수있는 경우가 있습니다.이 경우 조치가 신속하게 이루어지지 않을 수도 있고 전혀 반환되지 않을 수도 있습니다.

##### 2. 더 빨라진 자바스크립트 엔진, Nitro를 사용합니다.

**WKWebView**는 **UIWebView**의 JavaScript 엔진 보다 성능이 크게 향상된 Nitro JavaScript 엔진을 사용합니다. Nitro는 모바일 사파리에도 사용됩니다.

##### 3. JavaScript를 비동기로 처리합니다.

JavaScript와 네이티브 코드 간의 통신은 WKWebView에서 비동기로 처리됩니다. 즉, 일반적으로 더 빠르게 실행됩니다.

##### 4. 특정 터치 지연을 제거합니다.

**UIWebView** 및 **WKWebView** 브라우저 구성 요소는 앱에 대한 터치 이벤트를 해석하고 전달합니다. 결과적으로 터치 이벤트의 민감도 또는 속도를 높일 수있는 방법이 없습니다.

**UIWebView**는 사용자가 한 번 클릭했는지 두 번 클릭했는지를 결정하기 위해 무언가 터치 후 '300ms의 딜레이'를 추가합니다. 이 '딜레이'가 많은 유저들이 HTML기반의 웹앱들을 '느리다'고 생각하는 가장 중요한 이유중 하나입니다.

**WKWebView**에서는 300ms딜레이가 fast tap(<~125ms)후에만 추가되는 것으로 테스트 되었습니다.

fast tap을 포함한 모든 탭 이벤트에 대한 터치 지연을 없애기 위해 `FastClick` 또는 `다른 라이브러리`들을 추가할 수 있습니다.

##### 5. 서버 측 인증 문제 지원

서버 인증 문제를 지원하지 않는 **UIWebView**와 달리 **WKWebView**는 지원합니다. 실질적으로 **WKWebView**를 사용할때 암호로 보호된 웹사이트에 인증서를 입력할 수 있습니다.

##### 6. 오류가있는 자체 서명 보안 인증서 및 인증서 인증 지원

**WKWebView**를 사용하면 '계속'/ '취소'팝업을 통해 보안 인증서의 오류 (예 : 자체 서명 된 인증서 또는 만료 된 인증서 사용)를 무시할 수 있습니다.

> 문제점

##### 1. iOS 9 이상 필요

**WKWebView**는 iOS 8에서 처음 소개되었지만 로컬에 저장된 파일에 액세스 할 수 없다는 점을 포함하여 iOS 8 버전에는 중요한 제한 사항들이 있습니다. 따라서 이 기능은 iOS 9 이상 버전에서의 사용이 적합합니다.

##### 2. 로컬로 저장된 파일에 대한 AJAX 요청을 지원하지 않습니다.

**WKWebView**는 브라우저 엔진의 `cross origin resource sharing rules`을 위반하므로 file : // URI에 대한 XHR 요청을 허용하지 않습니다. 이러한 유형의 요청을 사용하는 프로젝트는 서버에서 원격으로 호스팅되거나 기존 **UIWebView** 탐색 엔진을 사용해야합니다.

##### 3. '쿠키 허용'설정을 지원하지 않습니다.

**WKWebView**는 쿠키 사용은 지원하지만 소스별로 허용되는 쿠키를 선택할 수 있는 기능은 노출하지 않습니다.

**WKWebView**는 '생성, 만료 날짜' 또는 '경로'같은 추가 정보가 아닌 쿠키의 이름에만 액세스 할 수 있게하여 쿠키에 문제가 발생할 경우 해결하는 것이 더 어려워 집니다.

##### 4. '고급 캐시 설정'을 지원하지 않습니다.

'캐시 원본' 및 '서버 리디렉션 이벤트에 대한 브라우저에만 알림'은 **WKWebView** 탐색 엔진을 사용할 때 적용되지 않습니다.

##### 5. 앱 종료시 HTML5 로컬 스토리지가 지워집니다.

앱이 종료되고 다시 실행되면 HTML5 로컬 저장소가 지워집니다.

> [https://docs.kioskproapp.com/article/840-wkwebview-supported-features-known-issues](https://docs.kioskproapp.com/article/840-wkwebview-supported-features-known-issues)의 글을 번역한 글입니다.  
> 건설적인 피드백 환영합니다!! :)

