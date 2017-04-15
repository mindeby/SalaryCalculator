//
//  ViewController.swift
//  SalaryCalculator
//
//  Created by Débora Ribeiro on 15/04/2017.
//  Copyright © 2017 Debora Ribeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var myTextFieldLabel: UITextField!
    @IBOutlet weak var ddPicker: UIPickerView!
    
    let ddPickerData = [0.0, 0.5, 1.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ddPicker.dataSource = self
        ddPicker.delegate = self
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ddPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rawItem = ddPickerData[row]
        let stringToShow: String
        
        switch rawItem {
            case 0.0:
                stringToShow = "0%"
            case 0.5:
                stringToShow = "50%"
            case 1.0:
                stringToShow = "100%"
            default:
                stringToShow = "Debs fix this"
        }
        
        return stringToShow
    }
}

