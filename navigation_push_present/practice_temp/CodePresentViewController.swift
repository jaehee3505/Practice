//
//  CodePresentViewController.swift
//  practice_temp
//
//  Created by 박재희 on 2022/02/26.
//

import UIKit
protocol SendDataDelegatePresent: AnyObject{
    func sendDataPresent(name: String)
}
class CodePresentViewController: UIViewController {
    
    var name: String?
    weak var delegate: SendDataDelegatePresent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name{
            self.nameLabel.text = name
            nameLabel.sizeToFit()
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.delegate?.sendDataPresent(name: "SecondGunterPresent")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
