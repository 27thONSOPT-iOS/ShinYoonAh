//
//  SecondViewController.swift
//  PA1_iOS
//
//  Created by SHIN YOON AH on 2020/10/14.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpDismiss(_ sender: Any) {
        guard let dvc = self.presentingViewController as? ViewController else { return }
        dvc.editLabels(part: partTextField.text ?? " ", name: nameTextField.text ?? " ")
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
