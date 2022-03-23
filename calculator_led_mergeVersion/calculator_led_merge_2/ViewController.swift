//
//  ViewController.swift
//  calculator_led_merge_2
//
//  Created by 박재희 on 2022/03/23.
//

import UIKit

class ViewController: UIViewController, SendResultDelegate{
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var mainResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainLabel.text = "Default"
    }
    @IBAction func tapGoCalculatorBtn(_ sender: UIButton) {
        guard let calculatorViewController = self.storyboard?.instantiateViewController(withIdentifier: "calculatorStoryboard") as? CalculatorViewController else { return }
        self.navigationController?.pushViewController(calculatorViewController, animated: true)
        calculatorViewController.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingViewController = segue.destination as? SettingViewController else { return }
        settingViewController.delegate = self
        settingViewController.textColor = self.mainLabel.textColor
        settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        settingViewController.mainText = self.mainLabel.text
    }
    
    func sendResult(result: Double) {
        
        if result.truncatingRemainder(dividingBy: 1) == 0{
        self.mainResultLabel.text = "\(Int(result))"
        }
        else{
            self.mainResultLabel.text = "\(result)"
        }
    }
    func sendText(text: String?, textColor: UIColor?, backgroundColor: UIColor?) {
        if let text = text{
            self.mainLabel.text = text
        }
        if let textColor = textColor{
            self.mainLabel.textColor = textColor
        }
        if let backgroundColor = backgroundColor{
            self.view.backgroundColor = backgroundColor
        }
       
    }

}

