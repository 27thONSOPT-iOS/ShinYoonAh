//
//  SignUpVC.swift
//  SOPT27_6thSeminar
//
//  Created by SHIN YOON AH on 2020/11/21.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func touchUpSignUp(_ sender: Any) {
        guard let emailText = emailTextField.text,
              let password = passwordTextField.text,
              let name = userNameTextField.text else {
            return
        }
        
        AuthService.shared.signUp(email: emailText,
                                  password: password, userName: name) { (networkResult) in
            switch networkResult {
            case .success(let data):
                if let data = data as? SignInData {
                    self.simpleAlert(title: "회원 가입 성공", message: "\(data.userName)님 회원 가입 성공!")
                    UserDefaults.standard.set(data.userName, forKey: "userName")
                    self.presentingViewController?.dismiss(animated: true, completion: nil)
                }
                print("success")
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "회원 가입 실패", message: message)
                }
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
