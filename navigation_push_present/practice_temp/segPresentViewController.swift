//
//  segPresentViewController.swift
//  practice_temp
//
//  Created by 박재희 on 2022/02/26.
//

import UIKit

class segPresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
