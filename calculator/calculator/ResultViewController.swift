//
//  ResultViewController.swift
//  calculator
//
//  Created by tjoeun-304 on 02/09/2019.
//  Copyright © 2019 tjoeun-304. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result: Double?
    
    @IBOutlet var lb_result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lb_result.text = "\(result!)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
