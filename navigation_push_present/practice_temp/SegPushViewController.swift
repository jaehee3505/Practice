//
//  SegPushViewController.swift
//  practice_temp
//
//  Created by 박재희 on 2022/02/26.
//

import UIKit

protocol SendDataDelegateSegPush: AnyObject{
    func sendDataSegPush(name: String)
}
class SegPushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDelegateSegPush?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SegPushViewController 뷰가 로드")
        if let name = name{
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SegPushViewController 뷰 나타날 예정")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SegPushViewController 뷰 나타남")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SegPushViewController 뷰 사라질 예정")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SegPushViewController 뷰 사라짐")
    }
    
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.delegate?.sendDataSegPush(name: "SegPushGunter")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
