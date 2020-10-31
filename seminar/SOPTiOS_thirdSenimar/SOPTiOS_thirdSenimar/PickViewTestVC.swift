//
//  PickViewTestVC.swift
//  SOPTiOS_thirdSenimar
//
//  Created by SHIN YOON AH on 2020/10/31.
//

import UIKit

class PickViewTestVC: UIViewController {
    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var partPickerView: UIPickerView!
    
    var parts: [Part] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // viewController에 위임하겠다
        setPartData()
        initLayout()
        
        partPickerView.dataSource = self
        partPickerView.delegate = self
    }
    
    func initLayout() {
        let initPart = parts[0]
        partImageView.image = initPart.makeImage()
        partNameLabel.text = initPart.partName
    }
    
    func setPartData() {
        parts.append(contentsOf: [
            Part(imageName: "plan", partName: "Plan"),
            Part(imageName: "design", partName: "Design"),
            Part(imageName: "server", partName: "Server"),
            Part(imageName: "ios", partName: "iOS"),
            Part(imageName: "android", partName: "Android"),
            Part(imageName: "web", partName: "Web")
        ])
    }
}

// pickerView 안에 들어가는 Data에 대한 것
// 두 가지를 필수적으로 구현 -> components 선택할 수 있는 영역
// 입력 값을 가지는 함수 구현 -> component 행의 갯수를 알려줌
extension PickViewTestVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return parts.count
    }
}

// 어떤 데이터가 들어갈 지 delegate에서 구현
extension PickViewTestVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return parts[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectPart = parts[row] // 선택된 파트 row 정보, 몇 번 행인지
        
        self.partImageView.image = selectPart.makeImage()
        self.partNameLabel.text =  selectPart.partName
    }
}
