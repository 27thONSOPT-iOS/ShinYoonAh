//
//  ViewController.swift
//  PA1_iOS
//
//  Created by SHIN YOON AH on 2020/10/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpLogin(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier:
        "navigationController") else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
        
        let vc = SecondViewController()
        vc.editLabelInfo = { part, name in
            self.partLabel.text = part
            self.statusLabel.text = name
        }
    }
}

