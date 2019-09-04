//
//  ViewController.swift
//  Navigator App
//
//  Created by tjoeun304 on 02/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditProtocol {
    
    
    

    @IBOutlet var lbId: UILabel!
    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 화면전환 직전에 자동으로 호출되는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editBtnSegue" {
            let target: EditViewController = segue.destination as! EditViewController
            target.id = self.lbId.text
            target.name = self.lbName.text
            target.age = Int(self.lbAge.text!)
            target.setInfoProtocol = self
        } else if segue.identifier == "updateBtnSegue" {
            let target: EditViewController = segue.destination as! EditViewController
            target.id = self.lbId.text
            target.name = self.lbName.text
            target.age = Int(self.lbAge.text!)
            target.setInfoProtocol = self
        }
    }

    func setUserInfomation(id: String, name: String, age: Int) {
        lbId.text = id
        lbName.text = name
        lbAge.text = "\(age)"
    }
}

