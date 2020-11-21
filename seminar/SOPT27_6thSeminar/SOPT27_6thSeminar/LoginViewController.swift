//
//  LoginViewController.swift
//  SOPT27_6thSeminar
//
//  Created by SHIN YOON AH on 2020/11/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
        let signUpStoryboard = UIStoryboard(name: "SignUp", bundle: nil)
        
        if let dvc = signUpStoryboard.instantiateViewController(identifier: "SignUpVC") as? SignUpVC {
            dvc.modalPresentationStyle = .fullScreen
            self.present(dvc, animated: true, completion: nil)
        }
    }
    
    @IBAction func touchUpLogin(_ sender: Any) {
        guard let emailText = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        AuthService.shared.signIn(email: emailText,
                                  password: password) { (networkResult) in
            switch networkResult {
            case .success(let data):
                if let data = data as? SignInData {
                    self.simpleAlert(title: "로그인 성공", message: "\(data.userName)님 로그인 성공!")
                    UserDefaults.standard.set(data.userName, forKey: "userName")
                }
                print("success")
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "로그인 실패", message: message)
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
