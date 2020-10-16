//
//  UIFont+Extension.swift
//  PA1_iOS_Pod
//
//  Created by SHIN YOON AH on 2020/10/16.
//

import UIKit

extension UIFont {
    static var defaultFont: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    static var defaultBold: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    static var defaultNormalFont: UIFont {
        return UIFont.systemFont(ofSize: 20)
    }
    
    static var defaultNormalBold: UIFont {
        return UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    static var defaultLargeFont: UIFont {
        return UIFont.systemFont(ofSize: 30)
    }
    
    static var defaultLargeBold: UIFont {
        return UIFont.systemFont(ofSize: 30, weight: .bold)
    }
}
