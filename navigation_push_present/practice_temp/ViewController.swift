//
//  ViewController.swift
//  practice_temp
//
//  Created by 박재희 on 2022/02/26.
//

import UIKit

class ViewController: UIViewController, SendDataDelegatePresent, SendDataDelegatePush, SendDataDelegateSegPush, SendDataDelegateSegPresent{
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        print("ViewController 뷰 로드")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController 뷰 나타날 예정")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController 뷰 나타남")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController 뷰 사라질 예정")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController 뷰 사라짐")
    }
    
    @IBAction func tapCodePushBtn(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushView")
        as? CodePushViewController else{ return }
        viewController.name = "PushGunter"
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func tapCodePresentBtn(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodeViewPresent")
        as? CodePresentViewController  else { return }
        viewController.modalPresentationStyle = .fullScreen
        viewController.name = "PresentGunter"
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SegPushViewController{
            viewController.name = "SegGunter"
            viewController.delegate = self
        }
        if let viewController = segue.destination as? segPresentViewController{
            viewController.name = "SegGunter"
            viewController.delegate = self
        }
    }
    func sendDataPresent(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
    func sendDataPush(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
    func sendDataSegPush(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
    func sendDataSegPresent(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

