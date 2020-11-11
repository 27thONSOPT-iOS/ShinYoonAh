//
//  LoginViewController.swift
//  PA3_iOS
//
//  Created by SHIN YOON AH on 2020/11/11.
//

import UIKit

class LoginViewController: UIViewController {
    var partNameEdit: ((String) -> Void)?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partTextField.delegate = self
        nameTextField.delegate = self
    }
    
    @IBAction func touchUpLogin(_ sender: Any) {
        partNameEdit?(partTextField.text ?? " ")
        dismiss(animated: true, completion: nil)
    }
}

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
