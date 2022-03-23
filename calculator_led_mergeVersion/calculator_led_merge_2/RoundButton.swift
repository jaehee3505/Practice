//
//  RoundButton.swift
//  calculator_led_merge_2
//
//  Created by 박재희 on 2022/03/23.
//

import UIKit

class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false{
        didSet{
            if isRound{
                self.layer.cornerRadius = self.layer.frame.height / 2
            }
        }
    }

}
