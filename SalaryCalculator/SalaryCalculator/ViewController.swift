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
    var selectedDD: Double = 0.0
    
    var salarioBase: Double = 0.0
    
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
        let theNumberThatWeGot = Double(myTextFieldLabel.text!)
        
        if let theNumberThatWeGot = theNumberThatWeGot {
            self.salarioBase = theNumberThatWeGot
            calculateSalarioLiquid()
            
        } else {
            self.salarioBase = 0.0
            calculateSalarioLiquid()
        }
    }
    
    func calculateSalarioLiquid() {
        let valueToShow: Double = (self.salarioBase + (self.salarioBase * self.selectedDD))
        self.resultsLabel.text = String(valueToShow)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedDD = self.ddPickerData[row]
        calculateSalarioLiquid()
        print(self.selectedDD)
    }
}

