# swift-webviewapp

<br>

## STEP1  웹 뷰

####  

### `UIWebViewDelegate` 

```swift
func webView(UIWebView, shouldStartLoadWith: URLRequest, navigationType: UIWebView.NavigationType) -> Bool
```

Sent before a web view begins loading a frame.

웹 뷰가 프레임로드를 시작하기 전에 알려줍니다.



```swift
func webViewDidStartLoad(UIWebView)
```

Sent after a web view starts loading a frame.

웹 뷰가 프레임 로드를 시작한 이후 알려줍니다.



```swift
func webViewDidFinishLoad(UIWebView)
```

Sent after a web view finishes loading a frame.

웹 뷰가 프레임로드를 끝낸 이후 알려줍니다.



```swift
func webView(UIWebView, didFailLoadWithError: Error)
```

Sent if a web view failed to load a frame.

 웹 뷰가 프레임로드를 실패시 알려줍니다.



#### UIWebView.NavigationType

|      Case       |          Description          |
| :-------------: | :---------------------------: |
|   linkClicked   |      유저가 링크를 탭 시      |
|  formSubmitted  |      유저가 폼을 제출시       |
|   backForward   | 앞으로 또는 뒤로 버튼을 탭 시 |
|     reload      |       reload 버튼 탭 시       |
| formResubmitted |    유저가 폼을 다시 제출시    |
|      other      |             그 외             |



<br>

#### WKWebView 와 UIWebView 의 차이는  엔진에서 차이를 보입니다.

<br>

## WKWebView's Advantages

### Runs outside of the app's main process

- #### 앱 의 메인 프로세스 밖에서 동작한다

  `WkWebView` 는 프로세스 외부에서 동작한다.

  앱으로 부터 분리된 스레드 메모레에서 동작함을 의미한다. 그래서 만약 메모리 할당을 초과하더라도, 앱이 죽지 않을 수 있다.

  <br>

### Uses Nitro, a faster JavaScript engine

- #### 더 빠른 자바스크립트 엔진  Nitro 를 사용한다.

  `WKWebView` 은 Nitro 엔진을 사용한다.

   이 엔진은 모바일 사파리에서 사용되고 있고, UIWebView's JavaScript engine 에 비해 많은 성능이 개선되었다.

  <br>

### Handles JavaScript asynchronously

- #### 비동기적으로 자바스크립트를 핸들링한다.

  ​	자바스크립트와 네이티브 코드간의 커뮤니케이션이 WKWebView에서는 비동기적으로 처리된다.

  ​	이건 더 빠르게 실행된다는 것을 의미한다.

<br>

### Eliminates certain touch delays

- #### 터치 딜레이의 제거

  UIWebView 와 WKWebView 브라우저 컴포넌트들은 해석하고, 앱으로 터치이벤트를 전달한다.

  우리는 터치이벤트의 속도와 민감도를 증가시킬수 없다.

  

  UIWebView는 어떤 것을 누르든 그 직후, 유저가 단일클릭을 한건지 더블클릭을 한건지 확인하기위해 300ms 의 딜레이를 더한다.

  이 딜레이는 HTML 기반의 웹 앱들이 유저들로 부터 느리다고 인식되는 이유이다.

  

  WKWebView는 더 빠르게 탭을 하는 경우(<~125ms )만 딜레이가 추가됩ㄴ다.

  모든 터치 이벤트에서 딜레이를 제거하기위해서  [FastClick](https://github.com/ftlabs/fastclick) 과 같은 라이브러리를 추가함으로써, 딜레이를 제거할 수 있습니다.

  

### Supports server-side authentication challenges

- #### 서버 사이드 인증을 지원한다.

  서버인증을 지원하지 않는 UIWebView와는 달리 WKWebView는 지원합니다.

  WKWebView를 사용 할 때, 우리는 암호로 보호되는 사이트를 들어가기위해서 자격증명을 입력 할 수 있습니다.



---

<br>

## Issues

### Requires iOS 9 or later 

- #### iOS 9 이상의 버전이 필수 입니다.

  

### Does not support AJAX requests to locally-stored files

- #### 로컬에 저장된 파일로의 AJAX( Asynchronous Javascript And Xml 요청을 지원하지 않습니다.

  WKWebView는 *XMLHttpRequest*(*XHR*) 을 브라우저의 CORS 룰을 위반하므로, file://URL을 허락해주지 않습니다.

  동일한 출처를 가져야하므로 로컬파일을 가져오는 요청은 거절됩니다.

  <br>

### Does not support 'Accept Cookies' setting

- #### Accept Cookies 설정을 지원하지않습니다.

  쿠키는 웹에 접속시 디바이스에 다운로드되고, 브라우저에 저장되는 텍스트파일, 웹사이트는 쿠키를 통해 사용자의 장치를 인식합니다.

  WKWebView는 쿠키의 사용을 지원하기는 하지만, 소스로부터 쿠키를 선택하는 것을 지원해주지 않습니다.

  이 말은 ‘Accept Cookies’ 는 WKWebView를 사용할 때, 적용되지 않는다는 것을 의미합니다.

  WKWebView는 단지 우리가 생성/만료일자, 경로, 등 다른  추가적인 정보를 접근하는 것을 허락하지않고, 쿠키이름에만 접근을 허용합니다.

  <br>

  

### Does not support 'Advanced Cache Settings'

- #### 'Advanced Cache Setting'을 지원하지 않습니다.

  캐시 소스와 서버 리다이렉션 이벤트를 지원하지 안습니다.

  <br>

### HTML5 local storage clears when app is exited

HTML5 로컬스토리지가 앱이 재시작되거나 꺼지면 비워집니다.

<br>

### Does not support logging of WebKit requests

WKWebView는 요청을 하고, 컨텐트 렌더링처리는 하지 않기 때문에, 요청을 로그할 수는 없습니다.



<br>

<br>

## STEP2

## 

#### WKWebViewConfiguration

|          **Name**           |        **Type**         |                         Description                          |                  Example                   |
| :-------------------------: | :---------------------: | :----------------------------------------------------------: | :----------------------------------------: |
| applicationNameForUserAgent |         String          |              사용자 대신 일을 해주는 소프트웨어              |                OS + browser                |
|         preferences         |      WKPreferences      |           WKWebView의 기본설정을 캡슐화해놓은 객체           |       자바스크립트 실행가능 여부 등        |
|         processPool         |      WKProcessPool      |            WKWebView 생성시에 지정한 프로세스 풀             |                     -                      |
|    userContentController    | WKUserContentController | WKWebView에 유저가 작성한 자바스크립트 코드를 주입하거나 메시지를 보내는 방법을 제공하는 객체 |                     -                      |
|      websiteDataStore       |   WKWebsiteDataStore    | 웹 사이트에서 사용되는 다양한 형태의 데이터를 표현하는 객체  | 데이터 캐시, 파일 캐시, 쿠키, 로컬스토리지 |

### WKNavigationAction

네이게이션을 야기하는 액션의 정보를 포함하는 객체

|    **Name**    |     **Type**     |                    Description                    |
| :------------: | :--------------: | :-----------------------------------------------: |
| navigationType | WKNavigationType |         네비게이션을 발생시킨 액션의 종류         |
|  sourceFrame   |   WKFrameInfo    |           네비게이션을 요청하는 프레임            |
|  targetFrame   |   WKFrameInfo    | 네비게이션이 도착지 프레임, 새로운 윈도우라면 nil |
|    request     |   NSURLRequest   |                네비게이션 요청객체                |

#### WKNavigationResponse

|    **Name**     |   **Type**    |                     Description                      |
| :-------------: | :-----------: | :--------------------------------------------------: |
|    response     | NSURLResponse |                 네비게이션 요청객체                  |
| isForMainFrame  |     Bool      | 네비게이션된 프레임이 메인 프레임인지  알려주는 bool |
| canShowMIMEType |     Bool      |   MIME 타입을 디스플레이 할지 여부를 표현하는 bool   |



#### User Scripts

- 스크립트 주입 시점 - `WKUserScriptInjectionTime`

- - Document Start 

    - ​	DOM 생성후 다른 컨텐트는 로드하기 전에 실행

  - Document End

    - ​	웹 컨텐트 로드 끝난 후, 별도의 서브 리소스를 로드하기 전에 실행

    

- 

- - All Frames
  - Main frame only

- **어떤 용도로 활용하기 좋은가**
- - Document 변경하기
  - 이벤트 처리
  - 리소스 불러오기
  - 앱과 통신하기



<img width="494" alt="스크린샷 2019-12-02 오후 6 51 16" src="https://user-images.githubusercontent.com/39197978/69953583-e5739600-153c-11ea-9b02-ba7dc05ecd1e.png">

