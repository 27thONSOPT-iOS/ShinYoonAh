//
//  SecondViewController.swift
//  PA1_iOS
//
//  Created by SHIN YOON AH on 2020/10/14.
//

import UIKit

class SecondViewController: UIViewController {
    var editLabelInfo: ((String, String) -> Void)?
    
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpDismiss(_ sender: Any) {
        self.editLabelInfo?(partTextField.text ?? " ", nameTextField.text ?? " ")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpSignUp(_ sender: UIButton) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier:
        "ThirdViewController") else {
            return
        }
        
        dvc.title = "Sign Up"
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}
