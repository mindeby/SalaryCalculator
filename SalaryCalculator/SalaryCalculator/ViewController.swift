//
//  ViewController.swift
//  SalaryCalculator
//
//  Created by Débora Ribeiro on 15/04/2017.
//  Copyright © 2017 Debora Ribeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var myTextFieldLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func typingInTextField(_ sender: Any) {
        var theNumberThatWeGot = Double(myTextFieldLabel.text!)
        if let theNumberThatWeGot = theNumberThatWeGot {
            let numberConverted = simpleCalc(numberToCalc: theNumberThatWeGot)
            
            print(numberConverted)
            resultsLabel.text = String(numberConverted)
            
        } else {
            // TODO: Replace passing a literal "0.0" string to the label, by the actual Double value
            theNumberThatWeGot = 0.0
            myTextFieldLabel.text = "0.0"
        }
    }
    
    func simpleCalc(numberToCalc: Double) -> Double {
        return (
            numberToCalc * 2.0
        )
    }
}

