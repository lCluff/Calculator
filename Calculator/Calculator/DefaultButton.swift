//
//  DefaultButton.swift
//  Calculator
//
//  Created by Leah Cluff on 7/15/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpButton()
    }
    
    func setUpButton() {
        layer.cornerRadius = 50.5
        layer.borderWidth = 4
    }
}
