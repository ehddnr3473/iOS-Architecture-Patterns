# MVP

![MVP](https://user-images.githubusercontent.com/55693272/207990795-7c88c9a8-2524-4b5e-b401-4109f150b222.PNG)

MVC와 똑같이 생겼지만 중요한 부분에서 다르다. MVC에서 View와 Controller는 강하게 결합(tightly coupled)되어 있었지만, 
**MVP**에서는 중재자(Mediator)인 **Presenter**가 view controller의 라이프 사이클과 아무런 연관이 없고 View는 쉽게 무시하여 Presenter에는 어떠한 레이아웃 코드도 포함되지 않는다. 
하지만 View를 데이터와 상태(state)로 업데이트해 주는 책임을 가지고 있다.

<br></br>
## UIViewController는 View이다.
MVP에서 **UIViewController**의 서브 클래스는 **Presenters**가 아니라 **Views**이다. 
이러한 구별은 수동으로 데이터 및 이벤트 바인딩을 만들어야 하므로 개발 속도 비용으로 뛰어난 테스트 가능성(testability)을 제공한다.

<br></br>
## Assembly에 관한 중요 참고 사항
MVP는 실제로 분리된 3개의 계층(layers)으로 인해 발생하는 어셈블리 문제를 드러내는 첫 번째 패턴이다. 
**View**가 **Model**에 대해서 알기를 바라지 않기 때문에 view controller(View)를 보여주는 곳에서 어셈블리하는 것은 옳지 않기 때문에 다른 곳에서 해야 한다. 
예를 들어, 어셈블리 및 View-to-View 프레젠테이션을 수행할 책임이 있는 App-wide **Router** 서비스를 만들어서 해결할 수 있다. 
이 문제는 MVP뿐만 아니라 다른 모든 패턴에서도 발생하며 해결해야 한다.

<br></br>
## MVP 특징
- **Distribution**: **Presenter**와 **Model** 사이에 대부분의 책임을 분담하고 있음. - 멍청한(dumb) **View**
- **Testability**: 멍청한 **View**로 인해 대부분의 비즈니스 로직을 테스트할 수 있음.
- **Easy of use**: 간단한 예제에서는 MVC에 비해 코드의 양이 두 배이지만, 동시에 MVP에 대한 아이디어는 매우 명확함.

<br></br>
> iOS의 MVP는 **뛰어난 테스트 가능성**과 **많은 코드**를 의미함.
