//
//  LoginViewController.swift
//  PA1_iOS_Pod
//
//  Created by SHIN YOON AH on 2020/10/16.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    let partLabel = UILabel()
    let nameLabel = UILabel()
    let partTextField = UITextField()
    let nameTextField = UITextField()
    let loginButton = UIButton()
    let signUpButton = UIButton()
    
    var editLabelText: ((String, String) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        
        view.addSubview(partLabel)
        view.addSubview(nameLabel)
        view.addSubview(partTextField)
        view.addSubview(nameTextField)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        partLabel.text = "파트"
        partLabel.font = .defaultBold
        partLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(130)
            make.leading.equalToSuperview().inset(60)
        }
        
        partTextField.borderStyle = .roundedRect
        partTextField.autocorrectionType = .no
        partTextField.autocapitalizationType = .none
        partTextField.snp.makeConstraints{ make in
            make.centerY.equalTo(partLabel)
            make.trailing.equalToSuperview().inset(60)
            make.leading.equalTo(partLabel.snp.trailing).offset(30)
        }
        
        nameLabel.text = "이름"
        nameLabel.font = .defaultBold
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(partLabel.snp.bottom).offset(50)
            make.leading.equalTo(partLabel)
        }
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        nameTextField.snp.makeConstraints{ make in
            make.centerY.equalTo(nameLabel)
            make.leading.equalTo(nameLabel.snp.trailing).offset(30)
            make.trailing.equalTo(partTextField)
        }
        
        loginButton.addTarget(self, action: #selector(touchUpLogin), for: .touchUpInside)
        loginButton.setTitle("로그인", for: .normal)
        loginButton.titleLabel?.font = .defaultFont
        loginButton.setTitleColor(.init(red: 250/255.0, green: 217/255.0, blue: 55/255.0, alpha: 1), for: .normal)
        loginButton.backgroundColor = .black
        loginButton.snp.makeConstraints{ make in
            make.top.equalTo(nameTextField.snp.bottom).offset(70)
            make.centerX.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(45)
        }
        
        signUpButton.addTarget(self, action: #selector(touchUpSignUp), for: .touchUpInside)
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.titleLabel?.font = .defaultFont
        signUpButton.setTitleColor(.init(red: 250/255.0, green: 217/255.0, blue: 55/255.0, alpha: 1), for: .normal)
        signUpButton.backgroundColor = .black
        signUpButton.snp.makeConstraints{ make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(45)
        }
    }
    
    @objc func touchUpLogin() {
        editLabelText?(partTextField.text ?? " ", nameTextField.text ?? " ")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpSignUp() {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
