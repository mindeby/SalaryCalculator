//
//  ViewController.swift
//  SalaryCalculator
//
//  Created by Débora Ribeiro on 15/04/2017.
//  Copyright © 2017 Debora Ribeiro. All rights reserved.
//

import UIKit





// This is a helper function, to round up the number of decimals
extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}






class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var myTextFieldLabel: UITextField!
    
    @IBOutlet weak var ddPicker: UIPickerView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperValue: UILabel!
    
    @IBOutlet weak var labelDiaria: UITextField!
    

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
    var diariaSA: Double = 0.0
    var diasSubsidio: Double = 22.0
    
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
    
    
    @IBAction func typedValorDiaria(_ sender: Any) {
        let valorRecebido = Double(labelDiaria.text!)
        
        if let valorRecebido = valorRecebido {
            diariaSA.self = valorRecebido
            calculateSalarioLiquido()
            
        } else {
            diariaSA.self = 0.0
            calculateSalarioLiquido()
            
        }
        
        calculateSalarioLiquido()
        
    }
        
    

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
    

    

    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    } ()
    
    //calculating salario Liquido
    
    func calculateSalarioLiquido() {
        
        
        var salarioBruto: Double = 0.0
        var irsPercentage: Double = 0.0
        let ssPercentage: Double = 0.11
        
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

        self.salarioLiquido = salarioBruto - (salarioBruto * ssPercentage) - (salarioBruto * irsPercentage) + (diasSubsidio * diariaSA.self)

        let valueToShow: Double = self.salarioLiquido
        let valueRoundedUp = valueToShow.roundTo(places: 2) // 👈 "Places" is the number of decimals BTW ;)
        self.resultsLabel.text = String(valueRoundedUp)
    
        
    }
}









