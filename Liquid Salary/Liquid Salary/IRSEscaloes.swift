//
//  IRSEscaloes.swift
//  Liquid Salary
//
//  Created by Débora Ribeiro on 03/03/2017.
//  Copyright © 2017 Debora Ribeiro. All rights reserved.
//

import Foundation



switch salarioBruto {
    
case 0...610 :
    0.0
case 610...618:
    1.8
case 618...640:
    5.0
case 640...678:
    6.0
case 678...730:
    7.5
case 730...805:
    8.5
case 805...912:
    11.0
case 912...993:
    12.5
case 993...1053:
    13.5
case 1053...1130:
    14.5
case 1130...1211:
    15.5
case 1211...1307:
    16.5
case 1307...1408:
    17.5
case 1408...1545:
    18.5
case 1545...1691:
    20.0
case 1691...1849:
    21.5
case 1849...1955:
    22.5
default: ""
    
    
}




label.text = salarioBruto - (salarioBruto * SS) - (salarioBruto * escalaoIRS) + subsidioAlimentacao
