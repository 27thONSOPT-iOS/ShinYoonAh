# ShinYoonAh

## 🐥 4주차 과제 (11/12_제출 완료) 🐥
- [**일반 과제**](https://github.com/27thONSOPT-iOS/ShinYoonAh/tree/master/assignment/PA3_iOS/PA3_iOS)

    ▶️ `TextField`를 눌러서 키보드가 나오면 애니메이션을 올렸다가 `return`를 누르면 애니메이션을 내려라

    → textfield를 누르는 것과 return 키를 누르는 것 모두 `UITextFieldDelegate`를 사용해서 구현하자!

    ```swift
    extension LoginViewController: UITextFieldDelegate {
        func textFieldDidBeginEditing(_ textField: UITextField) {
            let move = CGAffineTransform(translationX: 0, y: -50)

            UIView.animate(withDuration: 0.2, animations: {
                self.profileImage.transform = move
                self.partLabel.transform = move
                self.partTextField.transform = move
                self.nameLabel.transform = move
                self.nameTextField.transform = move
            })
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            UIView.animate(withDuration: 0.2, animations: {
                self.profileImage.transform = .identity
                self.partLabel.transform = .identity
                self.partTextField.transform = .identity
                self.nameLabel.transform = .identity
                self.nameTextField.transform = .identity
            })
            textField.resignFirstResponder()
            return true
        }
    }
    ```

    - UITextFieldDelegate에 있는 `textFieldDidBeginEditing`, `textFieldShouldReturn`를 사용
        - textFieldDidBeginEditing : textField 수정이 시작될 때 동작 → **textField를 누르면 동작**
        - textFieldShouldReturn : textField의 **return키를 눌렀을 때 동작**
    - `CGAffineTransform`의 `translaionX`를 사용해서 y좌표를 50 올리자 → animate함수에 넣어주면 이미지가 올라가는 동작이 완성
    - 다시 내려오는 동작은 `.identity`를 사용해서 원래 자리로 돌아오게 해주자
    - `resignFirstResponder` 는 키보드가 자동으로 내려가도록 동작함
    
<br/>    

- **도전 과제**

    ▶️ 스크롤을 할 경우 고정 헤더가 사라졌다가 멈추면 고정 헤더가 나타나게 하자 ❗️

    → `UIScrollViewDelegate`를 사용해서 헤더의 움직임을 구현하자!

    ```swift
    extension ViewController: UIScrollViewDelegate {
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            UIView.animate(withDuration: 0.3, animations: {
                if self.isTop == false {
                    self.headerView.transform = CGAffineTransform(translationX: 0, y: -88)
                }
                if scrollView.contentOffset.y > 0 {
                    self.isTop = false
                    self.scrollView.frame.size.height = UIScreen.main.bounds.size.height
                    self.scrollView.transform = CGAffineTransform(translationX: 0, y: -88)
                } else {
                    self.isTop = true
                }
            })
        }
        
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            UIView.animate(withDuration: 0.3, animations: {
                if scrollView.contentOffset.y >= 0 {
                    self.headerView.transform = .identity
                    self.scrollView.transform = .identity
                }
            })
        }
    }
    ```

    - UIScrollViewDelegate에 있는 `scrollViewDidScroll`과 `scrollViewDidEndDecelerating`를 사용
        - scrollViewDidScroll : **scrollView가 scroll되면 동작**
        - scrollViewDidEndDecelerating : scrollView가 scroll되다가 **scroll되는 속도가 감속되면 동작**

            → 이건 그냥 멈추면 헤더 나타나는 동작이 안 나타날 수도 있다

    - 헤더의 움직임은 일반 과제와 동일하게 `CGAffineTransform` 와 `.identity`를 사용
    - 움직이는 조건은 scrollView `y좌표의 contentOffset`이 0보다 크면 애니메이션이 작동하도록 했다

        →  상단에서 스크롤하면 움직이지 않도록, 그 외의 부분에서는 애니메이션 작동

    - `isTop`이라는 boolean값을 사용해서 `headerView`가 상단에서 스크롤할 때 움직이지 않도록 했다
    
    
    <br/>
    
    
    🔥 **`headerView`와 `scrollView`를 다른 조건에 넣은 이유**

    → 같은 조건(scrollView.contentOffset.y > 0)에 넣었더니 상단에서 스크롤 하고 나서 두 View 사이에 ⭐️**빈 틈**⭐️이 생김

    🔥 **`self.scrollView.frame.size.height = UIScreen.main.bounds.size.height` 을 매번 해주는 이유**

    → scrollView의 `frame`은 애니메이션에 의해서 `translationX의 y값`정도 위로 올라가 있다. 따라서 우리는 tabBar와 scrollView사이에 **⭐️틈⭐️**을 발견할 수 있다. 이 틈을 메우기 위해선 `scrollView의 frame height`를 `UIScreen의 height` 사이즈로 지정해줘야 한다.

    #### 📌 하지만 멈췄을 때는 원래의 height로 돌려줘야 한다는 걸 잊어선 안된다❗️

    #### ⭐️⭐️ 무엇보다도 viewDidLoad에 scrollView와 TextField를 `Delegate`해줘야 한다는 걸 잊지 말자 (제발!!) ⭐️⭐️
    
<br/>
<br/>

---    

## 🐥 3주차 과제 (11/06_제출 완료) 🐥
- [일반 과제](https://github.com/27thONSOPT-iOS/ShinYoonAh/tree/master/assignment/PA3_iOS/PA3_iOS)

### ✨Main.storyboard에 짠 View의 모습 ✨

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/5f55ebfd-432a-4bdd-bf4c-907805ac6e2c/_2020-11-06__9.34.04.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20201106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20201106T130115Z&X-Amz-Expires=86400&X-Amz-Signature=ca06870d893aefed52c1f2892ff2d68355bec43dc9cf457ba6407efe17f659e0&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22_2020-11-06__9.34.04.png%22" width="32%"></img>

- `고정 View`는 2주차 과제처럼 `ScrollView`와 분리해서 따로 `View`를 만들었다. 그럼 스크롤할 때 함께 올라가지 않는다.
- 아무것도 모르고 `CollectionView`를 사용해서 banner와 profile 화면을 모두 만들려고 했지만 실패했다🐌
- 먼저 `ScrollView`를 만들고 그 위에 `ImageView`와 `CollectionView`를 얹기로 마음 먹은 뒤에 시도❗️
- 결과적으로 위에 화면처럼 나왔다 짠🎆

    → 저 상태로 실행을 하면 `CollectionView`도 스크롤되고 `ScrollView`도 스크롤되는 신명나는 상황이 발생하기에 🌟**꼭 `CollectionView`에서 `View>Interaction>Multiple Touch` 눌러주기** 🌟

<br/>

✅ProfileViewCell

```cpp
func setCell(info: Profile) {
        profileImage.image = UIImage(named: info.imageName)
        profileName.text = info.imageName
        profileLabel.text = info.statusMessage
    }
```

- `cell`에 `setCell`이라는 함수를 만들어두고 Profile Data를 받아서 프로필 이미지, 프로필 이름, 프로필 상태 라벨을 설정할 수 있게 한다.

<br/>

✅ViewController(UICollectionViewDataSource)

```cpp
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profile.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell else {
            return UICollectionViewCell()
        }
        cell.setCell(info: profile[indexPath.item])
				// ProfileViewCell 안을 설정하기        

        return cell
    }
}
```

- `cell`이라는 변수에 `ProfileViewCell`를 받아와서 setCell함수를 부른다.
- profile이라는 데이터의 해당 **indexPath의 item**를 받아온다 → `TableView`는 **indexPath의 row** ❗️❗️

<br/>

✅ViewController(UICollectionViewDelegateFlowLayout)

```cpp
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 27
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 41, left: 20, bottom: 0, right: 20)
    }
}
```

- `TableView`와는 다르게 `CollectionView`는 해당 셀들의 위치를 `FlowLayout`를 통해서 잡아줄 수 있다.
1. 첫 번째 함수(sizeForItemAt) : **해당 cell의 크기 잡기**
2. 두 번째 함수(minimumLineSpacingForSectionAt) : **각각 셀들 위,아래의 Space**
3. 세 번째 함수(minimumInteritemSpacingForSectionAt) : **각각 셀들 좌,우의 Space**
4. 네 번째 함수(insetForSectionAt) : **CollectionView ContentInset 지정**


<br/>
<br/>

---

## 🐣 2주차 과제 (10/20_제출 완료) 🐣
- [도전 과제](https://github.com/27thONSOPT-iOS/ShinYoonAh/tree/master/assignment/PA2_iOS/PA2_iOS)

    ✅ViewController

    ```swift
    class ViewController: UIViewController, UIScrollViewDelegate {
        @IBOutlet weak var scrollView: UIScrollView!
        @IBOutlet weak var topButton: UIButton!

        override func viewDidLoad() {
            super.viewDidLoad()
            scrollView.delegate = self
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if(scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height) / 2) {
                topButton.isHidden = false
            } else {
                topButton.isHidden = true
            }
        }
    }
    ```

    - `scrollView`를 `scrollViewDidScroll`에서 사용하기 위해서 `UIScrollViewDelegate`를 Delegate한다.
    - 사용할 `scrollView`에 처음 view가 생성될 때 delegate한다.
    - `scrollView`가 움직일 때 content offset이 변경되는 데 그 offset의 y부분은 `scrollView.bounds.origin.y`와 같다.
    - 해당 content offset이 전체 스크롤뷰의 반 이상으로 내려오면 topButton이 보여지고 아니면 보이지 않게 한다.
    
    <br/>
    
    ```swift
    @IBAction func touchUpTop(_ sender: Any) {
            topButton.isHidden = true
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    ```
    
    - `topButton`를 누르면 보이지 않게 한다.  top 부분에 도달했을 때는 버튼이 보이지 않기 때문이다.
    - `setContentOffset`은 `UIScrollView`에서 특정 위치로 scroll할 때 사용된다.
    - `x축`으로는 스크롤할 필요가 없기 때문에 0으로 해주고 맨 위로 이동할 것이기에 `y축`도 0으로 맞춰준다.

<br/>
<br/>
    
---
## 🐣 1주차 과제 (10/16_제출 완료) 🐣
- [도전 과제](https://github.com/27thONSOPT-iOS/ShinYoonAh/tree/master/assignment/PA1_iOS/PA1_iOS)

    ✅SecondViewController

    ```swift
    @IBAction func touchUpDismiss(_ sender: Any) {
            guard let dvc = self.presentingViewController as? ViewController else { return }
            dvc.editLabels(part: partTextField.text ?? " ", name: nameTextField.text ?? " ")
            dismiss(animated: true, completion: nil)
    }
    ```

    ✅ViewController

    ```swift
    func editLabels(part: String, name: String) {
            partLabel.text = part
            statusLabel.text = "\(name) 님 안녕하세요 ~~ 🥰"
    }
    ```
    
    - `SecondViewController`에서 `로그인` 버튼을 누르는 경우, `ViewController`가 presenting 되면서 `ViewController`의 `editLabels`라는 함수를 call 한다. 
    - TextField.text의 값이 `editLabels`의 `part`와 `name`으로 전달된다.
    - `ViewController`의 `partLabel.text`값과 `statusLabel.text`로 넣어져서 `ViewController`로 `dismiss` 됐을 때 label의 값이 모두 변경된다.

<br/>

- [도전 과제(SnapKit 사용)](https://github.com/27thONSOPT-iOS/ShinYoonAh/tree/master/assignment/PA1_iOS_Pod/PA1_iOS_Pod)

    ✅ViewController

    ```swift
    @objc func touchUpPresent() {
            let loginVc = LoginViewController()
            let vc = UINavigationController(rootViewController: loginVc)
            vc.modalPresentationStyle = .fullScreen
            loginVc.editLabelText = { part, name in
                self.partNameLabel.text = part
                self.introduceLabel.text = "\(name) 님 안녕하세요!!!😂"
            }
            present(vc, animated: true, completion: nil)
    }
    ```

    ✅LoginViewController

    ```swift
    var editLabelText: ((String, String) -> ())?

    @objc func touchUpLogin() {
            editLabelText?(partTextField.text ?? " ", nameTextField.text ?? " ")
            dismiss(animated: true, completion: nil)
    }
    ```


    - `ViewController`에서 바로 `LoginViewController`를 사용하면 `NavigationController`가 present되지 않고 `NavigationController`만 present하면 빈 `NavigationController`가 present되기 때문에 `UINavigationController`의 `rootViewController`를 `LoginViewController`로 정해주어 `LoginViewController`가 present될 수 있게 하였다.
    - `LoginViewController`에서 `editLabelText`라는 closure를 선언해서 `ViewController`로 TextField.Text값을 전달해줬다.
