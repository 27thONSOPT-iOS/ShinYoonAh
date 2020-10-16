# ShinYoonAh

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
    1️⃣ `SecondViewController`에서 `로그인` 버튼을 누르는 경우, `ViewController`가 presenting 되면서 `ViewController`의 `editLabels`라는 함수를 call 한다. 
    <br/>
    2️⃣ TextField.text의 값이 `editLabels`의 `part`와 `name`으로 전달된다.
    <br/>
    3️⃣ `ViewController`의 `partLabel.text`값과 `statusLabel.text`로 넣어져서 `ViewController`로 `dismiss` 됐을 때 label의 값이 모두 변경된다.

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

    1️⃣ `ViewController`에서 바로 `LoginViewController`를 사용하면 `NavigationController`가 present되지 않고 `NavigationController`만 present하면 빈 `NavigationController`가 present되기 때문에 `UINavigationController`의 `rootViewController`를 `LoginViewController`로 정해주어 `LoginViewController`가 present될 수 있게 하였다.
    <br/>
    2️⃣ `LoginViewController`에서 `editLabelText`라는 closure를 선언해서 `ViewController`로 TextField.Text값을 전달해줬다.
