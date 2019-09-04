//
//  ViewController.swift
//  calculator
//
//  Created by tjoeun-304 on 02/09/2019.
//  Copyright © 2019 tjoeun-304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var num1: UITextField!
    @IBOutlet var num2: UITextField!
    @IBOutlet var plus: UISwitch!
    @IBOutlet var minus: UISwitch!
    @IBOutlet var multi: UISwitch!
    @IBOutlet var div: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var n1:Double? = Double(num1.text!)
        var n2:Double? = Double(num2.text!)
        
        
        if segue.identifier == "resultBtn" {
            let target = segue.destination as! ResultViewController
            if plus.isOn {
                target.result = n1! + n2!
            } else if minus.isOn {
                target.result = n1! - n2!
            } else if multi.isOn {
               target.result = n1! * n2!
            } else if div.isOn {
               target.result = n1! / n2!
            } else {
                
            }
            
        }
    }
    
    
    @IBAction func onPlusCheck(_ sender: UISwitch) {
        minus.isOn = false
        multi.isOn = false
        div.isOn = false
    }
    
    @IBAction func onMinusCheck(_ sender: UISwitch) {
        plus.isOn = false
        multi.isOn = false
        div.isOn = false
    }
    @IBAction func onMultiCheck(_ sender: UISwitch) {
        plus.isOn = false
        minus.isOn = false
        div.isOn = false
    }
    @IBAction func onDivCheck(_ sender: UISwitch) {
        plus.isOn = false
        minus.isOn = false
        multi.isOn = false
    }
    
    
    
}

