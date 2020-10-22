# ShinYoonAh


## 🐥 2주차 과제 (10/20_제출 완료) 🐥
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
## 🐥 1주차 과제 (10/16_제출 완료) 🐥
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
