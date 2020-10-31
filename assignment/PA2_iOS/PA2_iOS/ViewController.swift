//
//  ViewController.swift
//  PA2_iOS
//
//  Created by SHIN YOON AH on 2020/10/20.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        buttonSetUp()
    }
    
    func buttonSetUp() {
        topButton.layer.cornerRadius = 25
        topButton.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height) / 2) {
            topButton.isHidden = false
        } else {
            topButton.isHidden = true
        }
    }
    
    @IBAction func touchUpTop(_ sender: Any) {
        topButton.isHidden = true
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

