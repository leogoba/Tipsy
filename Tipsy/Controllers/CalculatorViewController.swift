//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.5
    var numberOfPerson = 0

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updateUI()
        sender.isSelected = true
        
        let userChoice = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(userChoice.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        tip = buttonTitleAsANumber / 100
        
        view.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPerson = Int(sender.value)
        view.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let NumBill = Double(billTextField.text ?? "0") ?? 0
        let result = NumBill * (1 + tip) / Double(numberOfPerson)
        print(String(format: "%.2f", result))
        
    }
    
    func updateUI() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

