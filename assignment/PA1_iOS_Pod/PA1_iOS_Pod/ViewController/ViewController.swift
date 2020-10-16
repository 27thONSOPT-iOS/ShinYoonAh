//
//  ViewController.swift
//  PA1_iOS_Pod
//
//  Created by SHIN YOON AH on 2020/10/16.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    let profileImage = UIImageView()
    let partLabel = UILabel()
    let partNameLabel = UILabel()
    let introduceLabel = UILabel()
    let presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
        
        setUp()
    }

    private func setUp() {
        view.backgroundColor = .white
        
        view.addSubview(profileImage)
        view.addSubview(partLabel)
        view.addSubview(partNameLabel)
        view.addSubview(introduceLabel)
        view.addSubview(presentButton)
        
        profileImage.image = UIImage(named: "image1")
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(70)
            make.centerX.equalToSuperview()
            make.size.equalTo(200)
        }
        
        partLabel.text = "파트"
        partLabel.font = .defaultBold
        partLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(135)
        }
        
        partNameLabel.text = "iOS"
        partNameLabel.font = .defaultFont
        partNameLabel.snp.makeConstraints { make in
            make.top.equalTo(partLabel)
            make.leading.equalTo(partLabel.snp.trailing).offset(70)
        }
        
        introduceLabel.text = "신윤아 님 안녕하세요!!!😂"
        introduceLabel.font = .defaultFont
        introduceLabel.snp.makeConstraints { make in
            make.top.equalTo(partLabel.snp.bottom).offset(45)
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width)
        }
        
        presentButton.addTarget(self, action: #selector(touchUpPresent), for: .touchUpInside)
        presentButton.setTitle("로그인 하러 가기", for: .normal)
        presentButton.titleLabel?.font = .defaultFont
        presentButton.setTitleColor(.lightGray, for: .normal)
        presentButton.snp.makeConstraints { make in
            make.top.equalTo(introduceLabel.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
        }
    }
    
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
}

