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
-> 사용자와의 interaction이 잦고 많은 소프트웨어에서 유용
~~~~

## 1.3 MVVM 패턴의 장점(iOS 기준 및 주관적)
~~~~
* 뷰와 모델이 완전히 독립적
* 코드의 재사용성
* 간결해진 ViewController 코드(안드로이드라면 Activity)
* 유지보수 용이
* 유닛 테스트 용이(아직 난 TDD에 익숙하지 않지만...)
~~~~

## 1.4 MVVM 패턴의 단점(iOS 기준 및 주관적)
~~~~
* 클래스가 많아진다.(너무 많은 ViewModel 클래스 필요)
* (Presentable을 활용할 경우)초기 세팅이 어렵고 귀찮 -> MVVM으로 진행한 프로젝트가 있다면 그나마 나은 편
* 예외 케이스에 대한 대처가 은근히 까다로움 -> 예를들면 UILabel이 NSAttributeString을 사용하는 경우
~~~~

## 1.5 주관적인 MVVM 패턴에 관한 생각
~~~~

-> 기존에 Presentable 방식을 활용할 때의 생각
처음 MVVM 패턴을 접했을땐 정말 신기하고 유용하다고 생각했지만 역시나 단점이 존재한다.
ViewModel이 많아진다는 점은 코딩양이 많아지니 가장 고민이 되는 부분이고
예외 상황(ex.일반적이지 않은 방식으로 View를 디자인하는 상황)에 어떻게 대응하는 것도 까다롭다.

하지만 스토리보드없이 작업하는 프로젝트에 적용하기 유용하고
아직은 공부하지 않았지만 PresentControl(?)이라는 방식과 함께 사용하면 더욱 좋다고 생각한다(아직 잘 모르는 부분)

결론은 앞으로 나는 스토리보드없이 프로젝트를 작업할 예정이고 MVVM 패턴을 적극 도입할 것이다.
우선 첫 프로젝트를 진행해보고 너무 생산성이 떨어진다면 고려해보겠지만
실제 상용화될 서비스를 개발한다면 지금 당장의 개발 생산성보다는 유지보수에 용이한 MVVM 패턴을 버리게 될 일은 없을 듯 하다.

-> 현재
Presentable을 활용하지 않는다면 스토리보드없이 작업하는 것과는 전혀 상관이 없게 된다.
하지만 여전히 뷰와 모델이 분리된다는 점, 테스트 용이성(앞으로 TDD를 적극적으로 도입할 예정)을 생각하면
여전히 MVVM 패턴이 충분히 유용하다고 생각한다.
~~~~

# 2. 네트워킹 설계 방식

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
* ViewController에서 여러개의 다른 요청을 보낼 경우 networkResult 메소드에서 구분하여 처리해주어야 한다.
  (난 Int형의 Code를 모든 요청마다 부여하여 구분했다.)
* 카테고리가 다른 요청마다 다른 Model 클래스를 초기화해서 사용해야했다.
* networkResult가 길어져 지저분
* ViewController와 Model이 독립적이지 못했다.
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
ErrorCode 열거형으로 구분지어 각 결과에 따라 다른 메세지를 사용자에게 띄우도록 함
실제로는 서버 상의 에러로 500 코드나 토큰 만료로 인한 401 코드만 실제 사용자들과 상호작용
(404-Not Found 같은 오류가 실제 서비스에서 나오면 안되지...)

->현재
ErrorHandling 프로토콜을 만들어 BaseVC에서 상속받아 showError(:ErrorCode) 메소드 정의 후
네트워킹 요청 시 인자로 전달
~~~~

  [0700fa06]: https://github.com/Yalantis/kotlin-mvp-example "코틀린 MVP 패턴 예제"

# 3. 스토리보드없이 작업

## 3.1 초기 설정 - 프로젝트 설정

![초기 설정스크린샷](https://github.com/redgun524/MVVM_Network_Model/blob/master/images/withoutstoryboard1.png)
~~~
1. 프로젝트 설정 General - Deployment Info - Main Interface을 비워준다.
~~~

## 3.2 초기 설정 - 초기 화면 설정
~~~
2. AppDelegate.swift의 func application(_: didFinishLaunchingWithOptions:)에서 다음과 같이 작업
Ex) 탭바컨트롤러가 초기 뷰컨트롤러인 경우
  첫번째 탭 : UINavigationController
  두번째 탭 : UIViewController
  세번째 탭 : UIViewController
~~~

### AppDelegate.swift
```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  window = UIWindow(frame: UIScreen.main.bounds)
        let tvc = UITabBarController()
        let vc1 = FirstVC()
        let vc2 = SecondVC()
        let vc3 = ThirdVC()
        let nvc1 = UINavigationController(rootViewController: vc1)
        vc1.tabBarItem = UITabBarItem(title: "1번", image: #imageLiteral(resourceName: "ic_3"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "2번", image: #imageLiteral(resourceName: "ic_2"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "3번", image: #imageLiteral(resourceName: "ic_1"), tag: 2)
        tvc.setViewControllers([nvc1, vc2, vc3], animated: true)
        window?.rootViewController = tvc
        window?.makeKeyAndVisible()
        return true
}
```

## 3.3 초기 설정 - Snapkit, Then 프레임워크

[GitHub - Snapkit][fbd62caa]

[GitHub - Then][1cd1f098]

  [fbd62caa]: https://github.com/SnapKit/SnapKit "GitHub - Snapkit"
  [1cd1f098]: https://github.com/devxoul/Then "GitHub - Then"

## 3.4 뷰컨트롤러 작업
~~~
뷰컨트롤러 내에서 동적으로 변할 뷰는 전역변수 / 옵셔널 강제 해제 구문으로 선언
정적인 뷰는 initView() 메소드 내에서 로컬로 생성하여 addSubview
UILabel의 경우 쓰임새가 많은 스타일을 Extension구문과 CustomTextStyle 열거형 타입을 직접 만들어서 관리
~~~
```
let txtDesc = UILabel().then {
  $0.text = "이것은 설명이다 설명. 설명을 하는 텍스트란 말이다."
  $0.setStyle(.description) //Extension 구문으로 setStyle(_ CustomTextStyle) 추가
}
view.addSubview(txtDesc)
```
```
tableView = UITableView().then {
  $0.register(MatchingCell.self)
  $0.delegate = self
  $0.dataSource = tableViewModel
  $0.rowHeight = 70
}
```


## 결론

~~~
여러 MVVM 모델을 보면서 정말 고민을 많이 했다.
수많은 예제에서 Presentable을 활용하여 각 뷰마다 뷰모델을 만들어 활용하고 있었다.
근데 자세히 보면 결국은 UITableViewCell에 한정된 예제가 많았다.
Cell은 대부분 네트워킹이나 로컬디비에서 가져온 모델을 활용하여 만들기 때문에 (각 뷰마다 뷰모델을 만들어) 쉽게 뷰와 모델을 바인딩할 수 있었다.
그런데 만약 ViewController에서 모델을 가져와 ViewController의 뷰에 적용하는 경우라면?
고민을 많이 해봤지만 그런 경우에 더욱 손쉽게 값을 설정하는 방법은 도저히 모르겠다.
여러 ViewController에서 재활용되는 View라면 당연히 뷰모델을 만들어 활용하겠지만 그렇지 않은 경우에 뷰모델을 만드는건 낭비하는 느낌이다.
그래서 재활용될 여지가 없는 뷰의 경우에는 따로 뷰모델을 만들어 사용하지 않는게 좋다는 결론이다.

그리고 Presentable 방식에 관한 의식이다. 뷰모델이라면 뷰의 모양새와 상관없이 뷰에 데이터만 바인딩 해주어야 하는데
일부 예제의 Presentable 프로토콜을 활용한 방식에서는 데이터를 바인딩 해줌과 동시에 뷰의 모양새까지 결정짓는다.
MVVM 패턴 공부를 하면서 뭔가 앞뒤가 안 맞는 느낌을 지울 수가 없었는데 이 문제를 파악하니 뭐가 계속 거슬렸는지 알았다.
우선 Presentable 방식은 버리기로 했다.

더 큰 회사 규모의 어플케이션이라면 어떨지 모르겠지만 지금 규모의 스타트업 어플에서는 빠른 개발이 더 중요하다고 생각해서 다음과 같은 결론을 지었다.

1. MVVM 패턴을 활용하되 Presentable 방식은 버린다.
    -> Then과 Style 열거형을 활용하여 초기화 시에 모양새를 만들어주고 모델을 통해 받아온 데이터만 따로 ViewModel을 통해 바인딩
2. ViewModel에서 뷰의 모양새와 관련된 코드는 전혀 사용하지 않는다.
    -> TableViewModel의 경우 UITableViewDataSource에 관한 코드만 작성하고 UITableViewDelegate는 View에서 작성
3. View(ViewController)에서는 기존의 스토리보드에서 작성 가능했던 부분만 작성해준다.(뷰는 오직 뷰의 역할만 하도록)
    -> 보여지는 UI, 사용자와의 인터랙션
4. 받아온 데이터를 활용하여 모델을 변경하는 경우 ViewModel에서 처리해준다.
~~~
