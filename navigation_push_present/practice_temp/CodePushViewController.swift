//
//  CodePushViewController.swift
//  practice_temp
//
//  Created by 박재희 on 2022/02/26.
//

import UIKit
protocol SendDataDelegatePush: AnyObject{
    func sendDataPush(name: String)
}
class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    weak var delegate: SendDataDelegatePush?
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name{
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.delegate?.sendDataPush(name: "SecondGunterPush")
        self.navigationController?.popViewController(animated: true)
    }
    
}
