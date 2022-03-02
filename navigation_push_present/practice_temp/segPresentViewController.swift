//
//  segPresentViewController.swift
//  practice_temp
//
//  Created by 박재희 on 2022/02/26.
//

import UIKit

protocol SendDataDelegateSegPresent:AnyObject{
    func sendDataSegPresent(name: String)
}

class segPresentViewController: UIViewController {

    var name: String?
    weak var delegate: SendDataDelegateSegPresent?
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SegPresentController 뷰 로드됨")
        if let name = name{
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SegPresentController 뷰 나타날 예정")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SegPresentController 뷰 나타남")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SegPresentController 뷰 사라질 예정")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SegPresentController 뷰 사라짐")
    }
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.delegate?.sendDataSegPresent(name: "SegPresentGunter")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
