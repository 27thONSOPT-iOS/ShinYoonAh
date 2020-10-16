//
//  SignUpViewController.swift
//  PA1_iOS_Pod
//
//  Created by SHIN YOON AH on 2020/10/16.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    let partLabel = UILabel()
    let birthLabel = UILabel()
    let nameLabel = UILabel()
    let partTextField = UITextField()
    let birthTextField = UITextField()
    let nameTextField = UITextField()
    let signUpButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sign Up"
        
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        
        view.addSubview(partLabel)
        view.addSubview(birthLabel)
        view.addSubview(nameLabel)
        view.addSubview(partTextField)
        view.addSubview(birthTextField)
        view.addSubview(nameTextField)
        view.addSubview(signUpButton)
        
        partLabel.text = "파트"
        partLabel.font = .defaultBold
        partLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(200)
            make.leading.equalToSuperview().inset(60)
        }
        
        birthLabel.text = "출생연도"
        birthLabel.font = .defaultBold
        birthLabel.snp.makeConstraints{ make in
            make.top.equalTo(partLabel.snp.bottom).offset(25)
            make.leading.equalTo(partLabel)
        }
        
        nameLabel.text = "이름"
        nameLabel.font = .defaultBold
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(birthLabel.snp.bottom).offset(25)
            make.leading.equalTo(partLabel)
        }
        
        partTextField.borderStyle = .roundedRect
        partTextField.autocorrectionType = .no
        partTextField.autocapitalizationType = .none
        partTextField.snp.makeConstraints{ make in
            make.centerY.equalTo(partLabel)
            make.leading.equalTo(partLabel.snp.trailing).offset(50)
            make.width.equalTo(220)
        }
        
        birthTextField.borderStyle = .roundedRect
        birthTextField.autocorrectionType = .no
        birthTextField.snp.makeConstraints{ make in
            make.centerY.equalTo(birthLabel)
            make.leading.equalTo(partTextField)
            make.width.equalTo(220)
        }
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.autocorrectionType = .no
        partTextField.autocapitalizationType = .none
        nameTextField.snp.makeConstraints{ make in
            make.centerY.equalTo(nameLabel)
            make.leading.equalTo(partTextField)
            make.width.equalTo(220)
        }
        
        signUpButton.addTarget(self, action: #selector(touchUpSignUp), for: .touchUpInside)
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.titleLabel?.font = .defaultFont
        signUpButton.setTitleColor(.init(red: 250/255.0, green: 217/255.0, blue: 55/255.0, alpha: 1), for: .normal)
        signUpButton.backgroundColor = .black
        signUpButton.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(45)
        }
    }
    
    @objc func touchUpSignUp() {
        navigationController?.popViewController(animated: true)
    }
}
