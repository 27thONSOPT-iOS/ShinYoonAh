//
//  SecondViewController.swift
//  SOPTiOS_firstWeek
//
//  Created by SHIN YOON AH on 2020/10/10.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpClose(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil) //present에서만 사용 가능
        
        self.navigationController?.popViewController(animated: true)
    }
}
