//
//  ViewController.swift
//  Liquid Salary
//
//  Created by Débora Ribeiro on 19/02/2017.
//  Copyright © 2017 Debora Ribeiro. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    
    
    @IBOutlet weak var valorBase: UITextField!
    
    
    @IBOutlet weak var subAlim: UITextField!
    
    
    @IBOutlet weak var duodecimos: UISegmentedControl!
    
    
    @IBOutlet weak var diasMes: UISegmentedControl!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func Calculate(_ sender: UIButton) {
        
        if let valorBaseConvertido = Double(valorBase.text!) {
            valorBaseConvertido + (valorBaseConvertido / 12 * duodecimos * 2)
        }
        else {
            ""
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

