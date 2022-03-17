//
//  RoundButton.swift
//  Calculator
//
//  Created by 박재희 on 2022/03/17.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false{
        didSet{
            if isRound{
                self.layer.cornerRadius =  (self.frame.height) / 2.2
            
            }
        }
    }

}
