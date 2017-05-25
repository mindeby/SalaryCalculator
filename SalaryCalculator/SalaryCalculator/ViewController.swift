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
    var salarioBruto: Double = 0.0
    var irsPercentage: Double = 0.0
    var salarioBase: Double = 0.0


    
// SALARIO BRUTO
    func calculateSalarioBruto() {
        self.salarioBruto = (self.salarioBase + (self.salarioBase * self.selectedDD))

    }
    
// IRS PERCENTAGE
    func calculateIrsPercentage() {
        
        switch salarioBruto {
            case 0...610 :
                self.irsPercentage = 0.0
            case 610...618:
                self.irsPercentage = 1.8
            case 618...640:
                self.irsPercentage = 5.0
            case 640...678:
                self.irsPercentage = 6.0
            case 678...730:
                self.irsPercentage = 7.5
            case 730...805:
                self.irsPercentage = 8.5
            case 805...912:
                self.irsPercentage = 11.0
            case 912...993:
                self.irsPercentage = 12.5
            case 993...1053:
                self.irsPercentage = 13.5
            case 1053...1130:
                self.irsPercentage = 14.5
            case 1130...1211:
                self.irsPercentage = 15.5
            case 1211...1307:
                self.irsPercentage = 16.5
            case 1307...1408:
                self.irsPercentage = 17.5
            case 1408...1545:
                self.irsPercentage = 18.5
            case 1545...1691:
                self.irsPercentage = 20.0
            case 1691...1849:
                self.irsPercentage = 21.5
            case 1849...1955:
                self.irsPercentage = 22.5
            default: break
        }
        
//        return irsPercentage //FIX  THIS
        
    }
    
    //  outras variaveis
    
    let SsPercentage: Double = 0.11
    var diasSubsidio: Double = 0.0
    var diariaSubsidioA: Double = 7.23
    var salarioLiquido: Double = 0.0
    
    // CALCULAR SALARIO LIQUIDO
    
    func calculateSalarioLiquido() {
        self.salarioLiquido = self.salarioBruto - (self.salarioBruto * self.SsPercentage) - (self.salarioBruto * self.irsPercentage) + (self.diasSubsidio * self.diariaSubsidioA)
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
    


    @IBAction func typingInTextField(_ sender: Any) {
        let theNumberThatWeGot = Double(myTextFieldLabel.text!)
        
        if let theNumberThatWeGot = theNumberThatWeGot {
            self.salarioBase = theNumberThatWeGot
            calculateIrsPercentage()
            calculateSalarioLiquido()
            
        } else {
            self.salarioBase = 0.0
            calculateSalarioLiquido()
        }
        
        let valueToShow: Double = salarioLiquido.self
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
            stringToShow = "Something went wrong"
        }
        
        return stringToShow
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedDD = self.ddPickerData[row]
        calculateSalarioLiquido()
        print(self.selectedDD)
    }
    

}










