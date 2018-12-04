# swift-webviewapp

# Step1
> UIWebview 사용

### 첨부파일
![Step1](CaptureImage/Step1.png)

# Step2
> WKWebview 사용

### 작업
1. UIWebview = Deprecated , 그래서 WKWebviw 로 변경
2. 사파리를 이용해 웹페이지를 디버깅하고 원하는 형태로 변경

### 첨부파일
![Step2_Before](CaptureImage/Step2_Before.png)
![Step2_After](CaptureImage/Step2_After.png)
![Step2_webDebug](CaptureImage/Step2_webDebug.png)

# Step3
> Script 코드 추가 및 Popup 창 제거

### 작업
1. WKUserScript 사용하고 script 코드 추가하여 Popup 창 제거
2. 같은 방법 및 다른 방법으로 다른 사이트도 적용

### 배민찬 팝업창 관련코드
```
var popup = document.querySelector('.app-download-popup');
if (popup != null) {
    popup.style.display = 'none';
}
```

### 쿠팡 팝업창 관련코드
```
// 방법 1
document.getElementById("fullBanner").className="close";

// 방법 2
let popup = document.querySelector('#fullBanner');
if (popup != null) {
    popup.className = 'close';
}

```

### 첨부파일
![Step3_1_Before](CaptureImage/Step3_1_Before.png)
![Step3_1_After](CaptureImage/Step3_1_After.png)
![Step3_2_Before](CaptureImage/Step3_2_Before.png)
![Step3_2_After](CaptureImage/Step3_2_After.png)
