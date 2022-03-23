//
//  CalculatorViewController.swift
//  calculator_led_merge_2
//
//  Created by 박재희 on 2022/03/23.
//

import UIKit
enum Operation{
    case add
    case subtract
    case multiply
    case divide
    case equl
    case unknown
}
protocol SendResultDelegate: AnyObject{
    func sendResult(result: Double)
    func sendText(text: String?, textColor: UIColor?, backgroundColor: UIColor?)
}
class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultLabel.text = "0"

    }
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    weak var delegate: SendResultDelegate?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func tapClearBtn(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.resultLabel.text = "0"
    }
    
    @IBAction func tapSubtractBtn(_ sender: UIButton) {
        self.calculate(.subtract)
    }
    @IBAction func tapNumberBtn(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9{
            self.displayNumber += numberValue
            self.resultLabel.text = self.displayNumber
        }
    }
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.delegate?.sendResult(result: Double(self.result) ?? 0)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapDivideBtn(_ sender: UIButton) {
        self.calculate(.divide)
    }
    @IBAction func tapMultiplyBtn(_ sender: UIButton) {
        self.calculate(.multiply)
    }
    @IBAction func tapAddBtn(_ sender: UIButton) {
        self.calculate(.add)
    }
    @IBAction func tapEqualBtn(_ sender: UIButton) {
        self.calculate(.equl)
    }
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if self.displayNumber.count < 8 , !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
        }
        self.resultLabel.text = self.displayNumber
    }
    private func calculate(_ operation: Operation){
        if self.currentOperation != .unknown{
            if !self.displayNumber.isEmpty{
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                switch currentOperation {
                case .add:
                    self.result = "\(firstOperand + secondOperand)"
                case .subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .multiply:
                    self.result = "\(firstOperand * secondOperand)"
                case .divide:
                    self.result = "\(firstOperand / secondOperand)"
                default:
                    break
                }
                if let result = Double(self.result) , result.truncatingRemainder(dividingBy: 1) == 0{
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                self.resultLabel.text = self.result
                //self.result = ""
            }
            self.currentOperation = operation
        }
        else{
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
    
}
