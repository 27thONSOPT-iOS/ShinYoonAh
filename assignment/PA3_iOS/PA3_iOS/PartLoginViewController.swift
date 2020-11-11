//
//  PartLoginViewController.swift
//  PA3_iOS
//
//  Created by SHIN YOON AH on 2020/11/11.
//

import UIKit

class PartLoginViewController: UIViewController {
    @IBOutlet weak var partLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpLogin(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.partNameEdit = { text in
            self.partLabel.text = text
        }
        self.present(vc, animated: true, completion: nil)
    }
}
