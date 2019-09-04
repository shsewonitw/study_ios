//
//  ResultViewController.swift
//  Calculator App
//
//  Created by tjoeun304 on 02/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var num1: Double = 0.0
    var num2: Double = 0.0
    var buho: String = "+"
    
    @IBOutlet var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var r = 0.0
        if buho == "+" {
            r = Double(num1 + num2)
        } else if buho == "-" {
            r = Double(num1 - num2)
        } else if buho == "*" {
            r = Double(num1 * num2)
        } else if buho == "/" {
            r = Double(num1 / num2)
        }
        
        self.lbResult.text = "\(num1) \(buho) \(num2) = \(r)"
    }

}
