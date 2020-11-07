//
//  AnimateViewController.swift
//  SOPTiOS_fourthWeek
//
//  Created by SHIN YOON AH on 2020/11/07.
//

import UIKit

class AnimateViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initPosition() {
        // 178 44 517 43 327 201
        image.frame = CGRect(x: 44, y: 178, width: 327, height: 201)
    }
    
    @IBAction func touchStart(_ sender: Any) {
//        UIView.animate(withDuration: 2.0, animations: {
//            self.image.alpha = 0
//        })
        
//        UIView.animate(withDuration: 2.0, animations: {
//            self.image.alpha = 0
//            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
//        }) { (finish) in
//            UIView.animate(withDuration: 1.0, animations: {
//                self.image.alpha = 1
//                self.initPosition()
//            }) { (finished) in
//                if finished {
//                    print("finished")
//                }
//            }
//        }
        
//        UIView.animate(withDuration: 2.0, animations: {
//           self.image.transform = CGAffineTransform(scaleX: 2.0, y: 0.5)
//           self.image.transform = CGAffineTransform(translationX: 100, y: 300)
//            self.image.transform = CGAffineTransform(rotationAngle: .pi / 2)
//        })
        
        let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let rotate = CGAffineTransform(rotationAngle: .pi)
        let move = CGAffineTransform(translationX: 100, y: 300)
        
        let combine = scale.concatenating(rotate).concatenating(move)
        
        UIView.animate(withDuration: 2.0, animations: {
            self.image.transform = combine
        }) { (finish) in
            UIView.animate(withDuration: 2.0, animations: {
                self.image.transform = .identity
            })
        }
    }
}
