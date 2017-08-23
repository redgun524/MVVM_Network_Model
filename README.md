# MVVM_Network_Model
개인적으로 짜본 MVVM 디자인 패턴 &amp; 네트워크 모델링 &amp; WithoutStoryboard

# 1. MVVM 패턴

## 1.1 MVVM 패턴이란?
~~~~
Model-View-ViewModel(MVVM)은 소프트웨어 아키택쳐 패턴 중 하나
~~~~
## 1.2 MVVM 패턴의 특징
~~~~
View와 ViewModel 간의 데이터바인딩
-> ViewModel이 Model을 통해 데이터를 받아와 변경사항을 View에 바로 적용
-> 사용자와의 interaction이 중요한 소프트웨어에서 유용
~~~~

## 1.3 MVVM 패턴의 장점(iOS 기준 및 주관적)
~~~~
* 뷰와 모델이 완전히 독립적
* 코드의 재사용성
* 간결해진 ViewController 코드(안드로이드라면 Activity)
* 유지보수 용이
~~~~

## 1.4 MVVM 패턴의 단점(iOS 기준 및 주관적)
~~~~
* 클래스가 많아진다
* 초기 세팅이 어렵고 귀찮 -> MVVM으로 진행한 프로젝트가 있다면 그나마 나은 편
* 너무 많은 ViewModel 클래스 필요
* 예외 케이스에 대한 대처가 은근히 까다로움 -> 예를들면 UILabel이 NSAttributeString을 사용하는 경우
~~~~

## 1.5 주관적인 MVVM 패턴에 관한 생각
~~~~
처음 MVVM 패턴을 접했을땐 정말 신기하고 유용하다고 생각했지만 역시나 단점이 존재한다.
ViewModel이 많아진다는 점은 코딩양이 많아지니 가장 고민이 되는 부분이고
예외 상황(ex.일반적이지 않은 방식으로 View를 디자인하는 상황)에 어떻게 대응하는 것도 까다롭다.

하지만 스토리보드없이 작업하는 프로젝트에 적용하기 유용하고
아직은 공부하지 않았지만 PresentControl(?)이라는 방식과 함께 사용하면 더욱 좋다고 생각한다(아직 잘 모르는 부분)

결론은 앞으로 나는 스토리보드없이 프로젝트를 작업할 예정이고 MVVM 패턴을 적극 도입할 것이다.
우선 첫 프로젝트를 진행해보고 너무 생산성이 떨어진다면 고려해보겠지만
실제 상용화될 서비스를 개발한다면 지금 당장의 개발 생산성보다는 유지보수에 용이한 MVVM 패턴을 버리게 될 일은 없을 듯 하다.
~~~~

# 2. 네트워크 모델링

## 2.1 REST API
~~~~
REST API를 통해 서버와 통신
~~~~

## 2.2 Alamofire & SwiftyJSON(iOS 기준)
~~~~
* Alamofire: 효율적인 HTTP 통신을 위한 iOS 프레임워크
* SwiftyJSON: JSON 포맷의 데이터를 손쉽게 파싱하여 사용하기 위한 프레임워크
~~~~

## 2.3 기존 네트워크 모델링 방식
~~~~
* NetworkCallback 프로토콜:
 networkResult, networkFail 메소드로 구성
 ViewController가 NetworkCallback를 구현하여 네트워킹 결과를 바로 사용하기 위한 방식

* NetworkModel 클래스:
 네트워킹에 필요한 기본적인 BaseUrl, 자주 사용되는 Header 등 네트워킹에 사용되는 프로퍼티로 구성
 요청 Path에 따라 NetworkModel을 상속받은 JoinModel, LoginModel 등의 클래스를 만들어 사용
 초기화 시 NetworkCallback(ViewController가 구현하는 프로토콜) 타입의 프로퍼티 초기화
 각 요청마다 메소드를 만들어서 네트워킹 요청을 하고 그 결과를
 NetworkCallback을 통해 ViewController에서 사용
~~~~

## 2.4 기존 네트워크 모델링 방식의 한계
~~~~
* ViewController에서 여러개의 다른 요청을 보낼 경우 networkResult 메소드에서 구분하여 처리해주어야 한다
  (난 Int형의 Code를 모든 요청마다 부여하여 구분했다)
* 카테고리가 다른 요청마다 다른 Model 클래스를 초기화해서 사용해야했다
* networkResult가 길어져 지저분
* ViewController와 Model이 독립적이지 못했다
~~~~

## 2.5 더 나은 방식을 보고 개선이 필요하다고 느낀 점

[코틀린 MVP 패턴 예제][0700fa06]
~~~~
운영 중인 서비스의 안드로이드 개발을 위해 Kotlin 공부를 하던 중
Github에서 멋진 안드로이드 MVP 패턴 프로젝트를 발견했다
이 프로젝트의 네트워킹 모델링 방식을 보고 현재 방식에서 개선할 점들을 찾았다

* 모든 요청을 하나의 클래스에서 접근하여 호출함
 -> 요청이 여러 모델 클래스에 나뉘어져 각 모델 클래스를 따로 초기화해야했던 단점 개선 가능
* 각 요청에서 바로 네트워킹 결과로 실행될 콜백함수를 클로저로 구현
 -> networkResult에 여러 요청의 네트워킹 결과가 집중되어 복잡하고 길었던 단점 개선 가능
* ViewController과 Model이 독립
 -> 실은 이 점은 MVVM 패턴과 더 연관이 있기는 하지만 여기서 느낀 점이긴 하다
~~~~

## 2.6 개선된 네트워크 모델

~~~~
* ApiManager 클래스
 요청 Path와 카테고리가 다른 각 요청을 위한 객체들을 lazy 프로퍼티로 갖는다
 카테고리별 클래스를 구현

* ApiBase 클래스
 기존 NetworkModel이 수행하던 역할을 수행
 모든 요청이 결국은 Alamofire.request 메소드를 사용하므로 필요한 항목 및 콜백함수를 인자로 받아
 Alamofire.request 메소드를 실행시키고 네트워크 성공, 실패에 따른 콜백함수를 실행시키는 request 메소드 구현

* 접근방법
 네트워크 요청이 필요한 ViewModel에서 ApiManager 타입의 api 프로퍼티 초기화
 요청 메소드 내에서 api.카테고리.메소드(HTTP 요청에 필요한 인자들, 성공 콜백, 실패 콜백)
~~~~

## 2.7 에러 처리
~~~~
네트워크 결과 따라오는 StatusCode들과 서버와 접속 자체가 안된 경우를
NetworkError 열거형으로 구분지어 각 결과에 따라 다른 메세지를 사용자에게 띄우도록 함
실제로는 서버 상의 에러로 500 코드나 토큰 만료로 인한 401 코드만 실제 사용자들과 상호작용
(404-Not Found 같은 오류가 실제 서비스에서 나오면 안되지...)
~~~~

  [0700fa06]: https://github.com/Yalantis/kotlin-mvp-example "코틀린 MVP 패턴 예제"

# 3. 스토리보드없이 작업
