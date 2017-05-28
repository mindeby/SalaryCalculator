//
//  ViewController.swift
//  SalaryCalculator
//
//  Created by Débora Ribeiro on 15/04/2017.
//  Copyright © 2017 Debora Ribeiro. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    } ()

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var myTextFieldLabel: UITextField!
    @IBOutlet weak var ddPicker: UIPickerView!
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperValue: UILabel!
    
    var diasSubsidio: Double = 22.0

    @IBAction func stepperAction(_ sender: Any) {
        stepperValue.text = "\(Int(stepper.value))" 
        let theStepperValue = Double("\(Int(stepper.value))" )

        if let theStepperValue = theStepperValue {
            diasSubsidio.self = theStepperValue
            calculateSalarioLiquido()
            
            
        } else {
            diasSubsidio.self = 0.0
            calculateSalarioLiquido()
            
        }
        calculateSalarioLiquido()

    }
    
    
    let ddPickerData = [0.0, 0.5, 1.0]
    var selectedDD: Double = 0.0
    var salarioBase: Double = 0.0
    var salarioLiquido: Double = 0.0
    
    // Setting Up the Picker View
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
            stringToShow = "Something went wrong"
        }
        
        
        return stringToShow
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDD = ddPickerData[row]
        calculateSalarioLiquido()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ddPicker.dataSource = self
        ddPicker.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This is just a comment to test if Debs know how to git


    @IBAction func typingInTextField(_ sender: Any) {


        let theNumberThatWeGot = Double(myTextFieldLabel.text!)
        
        if let theNumberThatWeGot = theNumberThatWeGot {
            salarioBase.self = theNumberThatWeGot
            calculateSalarioLiquido()
         
            
        } else {
            salarioBase.self = 0.0
            calculateSalarioLiquido()
          
        }
        calculateSalarioLiquido()
        
    }
    
    
    
    //calculating salario Liquido
    
    func calculateSalarioLiquido() {
        
        
        var salarioBruto: Double = 0.0
        var irsPercentage: Double = 0.0
        let ssPercentage: Double = 0.11
        let diariaSubsidioA: Double = 7.23
        
        salarioBruto = self.salarioBase + (self.salarioBase * (self.selectedDD/12*2))
        
        switch self.salarioBase {
            case 0...610 :
                irsPercentage = 0.0
            case 610...618:
                irsPercentage = 0.018
            case 618...640:
                irsPercentage = 0.05
            case 640...678:
                irsPercentage = 0.06
            case 678...730:
                irsPercentage = 0.075
            case 730...805:
                irsPercentage = 0.085
            case 805...912:
                irsPercentage = 0.11
            case 912...993:
                irsPercentage = 0.125
            case 993...1053:
                irsPercentage = 0.135
            case 1053...1130:
                irsPercentage = 0.145
            case 1130...1211:
                irsPercentage = 0.155
            case 1211...1307:
                irsPercentage = 0.165
            case 1307...1408:
                irsPercentage = 0.175
            case 1408...1545:
                irsPercentage = 0.185
            case 1545...1691:
                irsPercentage = 0.200
            case 1691...1849:
                irsPercentage = 0.215
            case 1849...1955:
                irsPercentage = 0.225
            default: break
        }

        self.salarioLiquido = salarioBruto - (salarioBruto * ssPercentage) - (salarioBruto * irsPercentage) + (diasSubsidio * diariaSubsidioA)

        let valueToShow: Double = self.salarioLiquido
        self.resultsLabel.text = String(valueToShow)
        
        
    }
    
    


}









