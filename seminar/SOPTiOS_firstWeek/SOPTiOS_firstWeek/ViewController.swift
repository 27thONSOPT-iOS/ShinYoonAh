//
//  ViewController.swift
//  SOPTiOS_firstWeek
//
//  Created by SHIN YOON AH on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpClick(_ sender: Any) {
        helloLabel.text = "hello ON SOPT!"
        helloLabel.sizeToFit() // text 크기만큼 label 크기 변경
    }
    @IBAction func touchUpPresent(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else {
            return
        }
        
        self.navigationController?.pushViewController(dvc, animated: true) // segue랑 같은 방식

//        self.present(dvc, animated: true, completion: nil) // ?가 찍혀있으면 nil 가능
    }
}

