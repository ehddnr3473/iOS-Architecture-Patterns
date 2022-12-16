# MVVM

![MVVM](https://user-images.githubusercontent.com/55693272/208023412-f4e69d92-03a8-4c1c-9faf-ed971eb7f1ab.PNG)

- **View Model**로 표현되는 **중재자**(Mediator)
- MVVM은 view controller를 **View**로 취급
- **View**와 **Model** 사이에 긴밀한 결합(tightly coupled)이 없음.

기본적으로 **View**와 **View의 상태**를 UIKit에서 독립적으로 표현한다. **View Model**은 **Model**의 변경을 호출하고 업데이트된 Model로 자체 업데이트를 수행하며, 
View와 View Model 사이에 **binding**을 수행하므로, View도 그에 따라 업데이트된다.

## MVVM 특징
- **Distribution**: MVVM의 View는 MVP의 View보다 더 많은 책임을 가지고 있다. 첫 번째는 binding을 설정하여 **View Model**에서 **View의 상태**를 업데이트하기 때문이고, 두 번째는 MVP가 모든 이벤트를 Presenter로 전달하고 자체 업데이트는 하지 않기 때문이다. 
- **Testability**: View Model은 View에 대해서 알지 못하기 때문에, **테스트가 쉽다.** View도 테스트할 수 있지만 UIKit 종속이므로 건너뛸 수 있다. 
- **Easy of use**: MVP는 View에서 Presenter로 모든 이벤트를 전달하고 View를 수동으로 업데이트해야 하는 반면, **MVVM은 binding을 사용할 때 코드의 양이 적어진다.**


<br></br>
> 다른 아키텍처 패턴의 이점을 결합하고 View 측 binding으로 인해 View 업데이트를 위한 추가 코드가 필요하지 않기 때문에 매력적이다. 테스트 가능성 또한 좋다.
