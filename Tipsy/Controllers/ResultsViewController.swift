//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jeffrey Vanelderen on 15/01/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalPricePerPersonLabel: UILabel!
    @IBOutlet weak var calculationLabel: UILabel!
    
    var tip: Tip?;

    override func viewDidLoad() {
        super.viewDidLoad()

        totalPricePerPersonLabel.text = "\(self.tip?.calculatePricePerPerson() ?? 0.0)";
        calculationLabel.text = self.tip?.getStringifiedCalculation();
    }
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true);
    }

}
