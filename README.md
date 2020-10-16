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

<br/>

    1. `SecondViewController`에서 `로그인` 버튼을 누르는 경우, `ViewController`가 presenting 되면서 `ViewController`의 `editLabels`라는 함수를 call 한다. 
    2. `TextField.text`의 값이 `editLabels`의 `part`와 `name`으로 전달된다.
    3. `ViewController`의 `partLabel.text`값과 `statusLabel.text`로 넣어져서 `ViewController`로 `dismiss` 됐을 때 `label`의 값이 모두 변경된다.

<br/>

- [도전 과제(SnapKit 사용)](https://github.com/27thONSOPT-iOS/ShinYoonAh/tree/master/assignment/PA1_iOS_Pod/PA1_iOS_Pod)
