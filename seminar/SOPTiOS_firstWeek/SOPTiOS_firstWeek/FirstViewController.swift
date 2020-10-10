//
//  FirstViewController.swift
//  SOPTiOS_firstWeek
//
//  Created by SHIN YOON AH on 2020/10/10.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var updateStateLabel: UILabel!
    @IBOutlet weak var updateIntervalLabel: UILabel!
    @IBOutlet weak var updateStateSwitch: UISwitch!
    @IBOutlet weak var updateIntervalStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            self.updateStateLabel.text = "자동 갱신"
        } else {
            self.updateStateLabel.text = "수동 갱신"
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.updateIntervalLabel.text = "\(Int(sender.value))분 마다"
        self.updateIntervalLabel.sizeToFit()
    }
    
    @IBAction func touchUpSubmit(_ sender: Any) {
        // if let도 똑같이 가능
        guard let dvc = self.storyboard?.instantiateViewController(identifier:
        "ResultViewController") as? ResultViewController else {
            return
        }
        
        // 결과 화면에 property 데이터를 전달
        dvc.email = self.emailTextField.text
        dvc.isAutoUpdate = self.updateStateSwitch.isOn
        dvc.updateInterval = Int(self.updateIntervalStepper.value)
        
        // modal 스타일 변경
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
    }
}
