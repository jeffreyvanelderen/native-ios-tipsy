//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalBillTextField: UITextField!
    
    @IBOutlet weak var noTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var amountOfPeopleStepper: UIStepper!
    
    private var tip: Tip?;
    
    @IBAction func onTipSelected(_ sender: UIButton) {
        totalBillTextField.endEditing(true);
        
        getTipButtons().forEach { button in
            button.isSelected = false;
        }
        
        sender.isSelected = true;
    }
    
    @IBAction func onSplitAmountChanged(_ sender: UIStepper) {
        splitAmountLabel.text = "\(Int(sender.value))";
        totalBillTextField.endEditing(true);
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        totalBillTextField.endEditing(true);
        
        let selectedButton = getTipButtons().first { button in
            button.isSelected
        }
        
        self.tip = Tip(totalPrice: Double(totalBillTextField.text!)!, numberOfPeople: Int(self.amountOfPeopleStepper.value), tipPercentage: Int(selectedButton!.tag));
        
        // via Segue
        self.performSegue(withIdentifier: "goToResult", sender: self);
        // Use prepare segue method to pass parameters to other VC
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            // Type cast needed since destination returns an object of super class UIViewController
            let vc = segue.destination as! ResultsViewController;
            vc.tip = self.tip;
        }
    }
    
    private func getTipButtons() -> [UIButton] {
        return [noTipButton, tenTipButton, twentyTipButton]
    }
}
