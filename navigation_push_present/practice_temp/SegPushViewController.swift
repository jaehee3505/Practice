//
//  SegPushViewController.swift
//  practice_temp
//
//  Created by 박재희 on 2022/02/26.
//

import UIKit

class SegPushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
