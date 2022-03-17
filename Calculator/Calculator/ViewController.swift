//
//  ViewController.swift
//  Calculator
//
//  Created by 박재희 on 2022/03/17.
//

import UIKit

enum Operation{
    case Add
    case Subtract
    case Divide
    case Multiply
    case Unknown
}

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .Unknown
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapNumberBtn(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.resultLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearBtn(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .Unknown
        self.resultLabel.text = "0"
    }
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.resultLabel.text = self.displayNumber
        }
    }
    @IBAction func tapDivBtn(_ sender: UIButton) {
        self.operation(.Divide)
    }
    @IBAction func tapMulBtn(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    @IBAction func tapSubBtn(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    @IBAction func tapAddBtn(_ sender: UIButton) {
        self.operation(.Add)
    }
    @IBAction func tapEqlBtn(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    func operation(_ operation: Operation) {
        if self.currentOperation != .Unknown{
            if !self.displayNumber.isEmpty{
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                guard let firstOperand = Double(self.firstOperand) else{ return }
                guard let secondOperand = Double(self.secondOperand) else{ return }
                switch self.currentOperation{
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                default:
                    break
                }
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                self.resultLabel.text = self.result
            }
            self.currentOperation = operation
        }
        else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
        
    }
}

