# MVC

## 전통적인 MVC
![tMVC](https://user-images.githubusercontent.com/55693272/207953075-7dffbb0f-193d-4a64-b46e-ffe53af5fe25.PNG)

**View**는 상태가 없으며 **Model**이 바뀔 때 **Controller**에 의해 렌더링 된다. 이와 관련하여 웹페이지에서 링크를 눌러서 이동할 때 완전히 다시 로딩되는 것을 상상해볼 수 있다. 
세 엔티티 모두 긴밀하게 결합하여 있고(tightly coupled), 각 엔티티는 다른 두 엔티티에 대해 알고 있으므로 각각의 재사용성이 매우 떨어진다. 
따라서 전통적인 MVC는 최신 iOS 개발에 적용할 수 없다.

<br></br>
## Apple's MVC
### Expectation
![aMVC](https://user-images.githubusercontent.com/55693272/207954153-3e867d51-f11d-4d0f-b3ee-827a4ab28d4d.PNG)

**Controller**는 **View**와 **Model** 사이의 중재자(Mediator)이므로, 그들은 서로를 모른다. Controller가 재사용 가능성이 가장 낮은 데, 이는 일반적으로 괜찮다. 
Model에 맞지 않는 모든 까다로운 비즈니스 로직을 위한 장소로 Controller를 사용하기 때문이다.
이론적으로 괜찮아 보이지만, iOS 개발을 하면서 사용했던 MVC와는 달라서 이상하다.

<br></br>
### Reality
![rMVC](https://user-images.githubusercontent.com/55693272/207954949-30b3abd6-80f6-4fa4-8ae8-5036406f34e0.PNG)

Cocoa MVC는 거대한 View Controllers를 작성하는 것을 장려한다. View life cycle에 너무 많이 관여해서 별개라고 말하기 어렵기 때문이다.
비즈니스 로직 및 데이터 변환 일부를 모델 레이어로 이동시킬(떠넘길) 수는 있지만, 작업을 View로 이동시킬 때는 선택의 여지가 많지 않다. 
대부분 View의 책임은 사용자 액션을 컨트롤러로 보내는 것이다. view controller는 모든 것의 delegate이자 data source이고 일반적으로 네트워크 요청을 발송하고 취소하는 일까지 담당한다.

```swift
var userCell = tableView.dequeueReusableCellWithIdentifier("identifier") as UserCell
userCell.configureWithUser(user)
```
위의 cell과 같이 모델로 직접 구성하는 View는 MVC 가이드라인을 위반한 것이지만, 항상 이래왔고 사람들은 뭔가 잘못되었다고 느끼지 못했다. 
만약 MVC를 강하게 따른다고 하면, Model을 View로 넘기지 말고, Controller로 구성(configure)해야 하고, 그러면 Controller의 크기는 훨씬 더 커질 것이다. 

유닛 테스트를 수행할 때 MVC의 문제점은 명백히 드러난다. 
view controller가 view와 강하게 결합되어 있으므로, 비즈니스 로직이 레이아웃 코드에서 가능한 한 많이 분리되는 방식으로 뷰와 그것들의 라이프 사이클을 무시하는 데 많은 힘을 들여야 하므로 테스트가 어렵다.
모델은 별도로 테스트할 수 있지만, UIView와 관련된 메서드(viewDidLoad()나 버튼의 action 메서드)를 직접 호출하지 않고는 프레젠테이션 로직을 테스트할 수 없으므로 모든 view 들을 로딩하게 되고, 그것은 유닛 테스트에 좋지 않다. 
또한, View와 Controller 간의 상호 작용은 실제로 유닛 테스트로 테스트할 수 없다.


<br></br>
## Cocoa MVC 특징
- **Distribution**: **View**와 **Model**은 분리되어 있지만, **View**와 **Controller**는 **강하게 결합**(tightly coupled)되어 있다.
- **Testability**: 좋지 않은 책임 분배(distribution) 때문에, 일반적으로 **Model**만 테스트할 수 있다.
- **Ease of use**: 다른 패턴에 비해 코드의 양이 가장 적다. 모든 사람에게 친숙하기 때문에 미숙한 개발자도 관리하기 쉽다.

<br></br>
> Cocoa MVC는 아키텍처에 더 많은 시간을 투자할 준비가 되어 있지 않고, 작은 프로젝트에 다른 아키텍처를 사용하는 것이 과하다고 느껴질 때 선택할만하다. 개발 속도 측면에서는 최고의 아키텍처 패턴이다.
