//
//  CustomTabBarController.swift
//  SOPTiOS_fourthWeek
//
//  Created by SHIN YOON AH on 2020/11/07.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
    }
    
    func setTabs() {
        guard let purpleVC = self.storyboard?.instantiateViewController(withIdentifier: "PurpleVC") as? PurpleVC,
              let yellowVC = self.storyboard?.instantiateViewController(withIdentifier: "YellowVC") as? YellowVC else {
            return
        }
        
        purpleVC.tabBarItem.image = UIImage(systemName: "house")
        purpleVC.tabBarItem.title = "Home"
        purpleVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        yellowVC.tabBarItem.image = UIImage(systemName: "person")
        yellowVC.tabBarItem.title = "Profile"
        yellowVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        setViewControllers([purpleVC, yellowVC], animated: true)
    }
}
