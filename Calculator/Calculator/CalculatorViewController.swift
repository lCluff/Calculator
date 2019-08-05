//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Leah Cluff on 7/15/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet var buttons: [DefaultButton]!
    
    fileprivate var firstNumber: Double = 0.00
    fileprivate var symbol: String = ""
    fileprivate var isButtonPressed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }
    
    //Button Collection
    func setupUI() {
        UIView.animate(withDuration: 0.2) {
            self.resultsLabel.textColor = UIColor.white
            self.view.backgroundColor = UIColor.black
            self.titleLabel.textColor = UIColor.white
           
            
        }
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        let buttonText =  sender.titleLabel?.text!
        let labelText = resultsLabel.text!
        if buttonText == "." && labelText.contains(".") {
            
            return
        }
        if isButtonPressed {
            resultsLabel.text = buttonText
            isButtonPressed = false
            return
        }
        
        resultsLabel.text = "\((Double(labelText) != 0.0 || labelText.contains(".") || buttonText == ".") ? labelText : "")" + "\(buttonText!)"
    }
    @IBAction func symbolButtonTapped(_ sender: UIButton) {
        firstNumber = Double(resultsLabel.text!)!
        symbol = (sender.titleLabel?.text)!
        isButtonPressed = true
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        let secondNumber = Double(resultsLabel.text!)!
        let result = calculate(secondNumber)
        resultsLabel.text = String(result)
        firstNumber = 0.0
        symbol = ""
        isButtonPressed = true
        
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resultsLabel.text = String(0)
        firstNumber = 0.0
        symbol = ""
        isButtonPressed = false
    }
    
    private func calculate(_ secondNumber: Double) -> Double {
        switch symbol {
        case "+": return firstNumber + secondNumber
        case "-": return firstNumber - secondNumber
        case "x": return firstNumber * secondNumber
        case "/": return firstNumber / secondNumber
        default: return Double(resultsLabel.text!)!
        }
    }
}


