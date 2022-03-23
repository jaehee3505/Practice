//
//  SettingViewController.swift
//  calculator_led_merge_2
//
//  Created by 박재희 on 2022/03/23.
//

import UIKit


class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let textColor = self.textColor{
            self.changeTextColorBtnAlpha(color: textColor)
        }
        if let backgroundColor = self.backgroundColor{
            self.changeBackgroundColorBtnAlpha(color: backgroundColor)
        }
        if let text = self.mainText{
            self.textField.text = text
        }
    }
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    
    weak var delegate: SendResultDelegate?
    var textColor: UIColor?
    var backgroundColor: UIColor?
    var mainText: String?
    
    @IBAction func tapTextColorBtn(_ sender: UIButton) {
        switch sender{
        case yellowBtn:
            self.changeTextColorBtnAlpha(color: .systemYellow)
            self.textColor = .systemYellow
        case orangeBtn:
            self.changeTextColorBtnAlpha(color: .orange)
            self.textColor = .orange
        case purpleBtn:
            self.changeTextColorBtnAlpha(color: .purple)
            self.textColor = .purple
        default:
            break
        }
    }
    @IBAction func tapBackgroundColorBtn(_ sender: UIButton) {
        switch sender{
        case blackBtn:
            self.changeBackgroundColorBtnAlpha(color: .black)
            self.backgroundColor = .black
        case blueBtn:
            self.changeBackgroundColorBtnAlpha(color: .blue)
            self.backgroundColor = .blue
        case greenBtn:
            self.changeBackgroundColorBtnAlpha(color: .green)
            self.backgroundColor = .green
        default:
            break
        }
    }
    @IBAction func tapSaveBtn(_ sender: UIButton) {
        self.delegate?.sendText(text: self.textField.text, textColor: self.textColor, backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    private func changeTextColorBtnAlpha(color: UIColor){
        self.yellowBtn.alpha = color == .systemYellow ? 1 : 0.2
        self.orangeBtn.alpha = color == .orange ? 1 : 0.2
        self.purpleBtn.alpha = color == .purple ? 1 : 0.2
    }
    private func changeBackgroundColorBtnAlpha(color: UIColor){
        self.blackBtn.alpha = color == .black ? 1 : 0.2
        self.blueBtn.alpha = color == .blue ? 1 : 0.2
        self.greenBtn.alpha = color == .green ? 1 : 0.2
    }
    
}

