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

### 실행화면

<img width="400" alt="step-01" src="https://user-images.githubusercontent.com/38850628/55886374-93b18080-5be6-11e9-9d42-3a3d22c8b263.png">

## step-02. WKWebView와 웹킷

### 배운내용

#### WKWebView

##### iOS 8.0 and OS X 10.10에서 시작한다면 WKWebView를 사용해야한다. UIWebView or WebView를 사용하면 안된다.

<img width="746" alt="wkwebview01" src="https://user-images.githubusercontent.com/38850628/55879574-eb95ba80-5bd9-11e9-8add-347bfd668b4b.png">

##### `init(frame:configuration:)` 메소드로 새로운 WKWebView 객체를 만든 후 로드를 할 수 있다.

##### `loadHTMLString(_:baseURL:)` 메소드로 로컬에 있는 HTML 파일들을 로딩할수 있다.

##### `load(_:)` 메소드로 웹컨텐츠를 로딩할 수 있다.

##### `stopLoading()` 메소드로 로딩을 멈출 수 있고, `isLoading` 프로퍼티로 웹뷰가 로딩중인지 알 수 있다.

##### `WKUIDelegate` 프로토콜을 준수하는 객체를 delegate 프로퍼티에 set하는것으로 웹컨텐츠의 로딩을 추적할 수 있다.

<img width="750" alt="wkwebview02" src="https://user-images.githubusercontent.com/38850628/55879576-eb95ba80-5bd9-11e9-9319-b86dd4937712.png">

##### 사용자가 웹페이지의 히스토리를 앞뒤로 이동할 수 있도록 하려면 `goBack()` 과 `goForward()` 메서드를 사용하면 된다.

##### `canGoBack` 과 `canGoForward` 프로퍼티들을 이용하여 앞이나 뒤로 이동할 수 없을때 해당 버튼을 비활성화 시킨다.

##### 기본적으로 웹뷰는 컨텐츠에 나타나는 전화 번호를 전화 링크로 변환해준다.

##### 전화 링크를 클릭하면 전화 앱이 켜지고 전화가 걸어진다.

##### 이 기능을 해제하려면 `phoneNumber` flag가 포함되지 않은 `WKDataDetectorTypes` 비트필드로 `dataDetectorTypes`을 set하면 된다.

##### `setMagnification(_:centeredAt:)` 을 사용하면 웹뷰 처음 표시될때의 웹 컨텐츠의 scale을 programmatically하게 설정할 수 있다.

##### 그 후엔 유저가 제스쳐를 통해 scale을 변경할 수 있다.

<img width="762" alt="wkwebview03" src="https://user-images.githubusercontent.com/38850628/55879577-ec2e5100-5bd9-11e9-8616-7d23bab92c66.png">

> 출처 - 애플 공식 문서 [https://developer.apple.com/documentation/webkit/wkwebview](https://developer.apple.com/documentation/webkit/wkwebview)

##### 맥 Safari 에서 Develop > Simulator 메뉴를 활용하면 웹에서 사이트를 불러오는 과정을 볼 수 있다.

##### 그런데 Develop 메뉴가 그냥 있는것이 아니다. Safari 설정 -> 고급 -> 메뉴 막대에서 개발자용 메뉴 보기를 활성화해야한다.

##### 그리고 아이폰 설정 -> Safari -> 고급 -> 웹속성도 활성화해주면 이제 맥 Safari Develop메뉴에서 웹속성을 볼 수 있다.

##### WKWebView의 애플 공식문서 샘플 코드를 보면 loadView() 부분에 super를 호출하는 부분이 없다.
##### 그래서 왜? 호출하지 않았을까 해서 loadView()의 공식문서를 살펴봤더니 
##### `Your custom implementation of this method should not call super.` 라는 부분이 있었다. 
##### 그래서 왜? 호출하지 말라고 했을까 생각해서 검색해보니
##### <s>모르겠다. 그래서 애플에 물어보기로 했다. 스택오버플로우에도 질문글을 올리기로 했다.</s>
##### loadView()에서 super를 호출하면 기본 뷰로드 동작이 시작되고 CPU주기가 낭비되기 때문에 사용하지 말아야한다.

##### loadView()를 알아보면서 다른 override method에서도 super를 많이 호출하는데 그 이유를 알게 되었다.
##### 예를들어 viewDidLoad()의 경우에는 아무것도 하지 않으므로 super를 호출할 필요가 없다.
##### 하지만 super를 호출하는 습관은 상속구조를 변경할때 꽃을 피우게 된다.

##### 그리고 initializing/setting up 을 할때는 super를 먼저 호출하고
##### tearing down/cleaning up 할때는 super를 나중에 호출하는게 좋다.

> 건설적인 피드백 환영합니다~~!!

### 실행화면

<img width="400" alt="step-02" src="https://user-images.githubusercontent.com/38850628/55886375-93b18080-5be6-11e9-9913-c1eddf2ef697.png">

<img width="762" alt="webProperty" src="https://user-images.githubusercontent.com/38850628/55886377-93b18080-5be6-11e9-8a2e-2d4cd97c9967.png">

## step-03. 모바일 웹 페이지 로딩과 액션

### 배운내용

#### 네이티브에서 JS를 호출하는 방법을 배웠다.

1. WKUserScript를 이용한 방법
2. (WKWebView).evaluateJavaScript를 이용한 방법

**WKUserScript를 사용한 방법**

```swift
let source = """
var popup = document.querySelector('#list_area1');
if (popup != null) {
popup.style.display = 'none';
}
"""

let script = WKUserScript(source: source,
injectionTime: .atDocumentEnd,
forMainFrameOnly: true)

let contentController = WKUserContentController()
contentController.addUserScript(script)

let webConfiguration = WKWebViewConfiguration()
webConfiguration.userContentController = contentController

wkWebView = WKWebView(frame: .zero, configuration: webConfiguration)
view = wkWebView
```

injectTime의 종류는

- atDocumentStart
- atDocumentEnd

이렇게 2가지가 있는데 `atDocumentStart`는 DOM tree가 로드되기 시작할때 `atDocumentEnd`는 DOM tree가 로드된 후 타이밍을 나타낸다는 것을 배웠다.

**evaluateJavaScript를 사용한 방법**

```swift
wkWebView?.evaluateJavaScript(script,
completionHandler: nil)
```


### 실행화면

<img width="400" alt="webProperty" src="https://user-images.githubusercontent.com/38850628/56191836-19f71800-6068-11e9-84e8-10f3c8465ebe.png">


## step-04. 사파리 뷰컨트롤러

### 배운내용


### 실행화면

<img width="400" alt="webProperty" src="https://user-images.githubusercontent.com/38850628/56403592-ff59b480-629c-11e9-849a-229ea86dfd22.png">
<img width="400" alt="webProperty" src="https://user-images.githubusercontent.com/38850628/56403593-ff59b480-629c-11e9-9af1-879586b8bd42.png">

