//
//  ViewController.swift
//  Alert App
//
//  Created by tjoeun304 on 02/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isLampOn = true
    
    let lampOn = UIImage(named: "on.jpg")
    let lampOff = UIImage(named: "off.jpg")
    let lampRemove = UIImage(named: "remove.jpg")
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if isLampOn {
            let lampOnAlert = UIAlertController(title: "경고", message: "이미 On 상태 입니다.", preferredStyle: UIAlertController.Style.alert)
            let lampOnAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(lampOnAction)
            present(lampOnAlert, animated: true, completion: nil)
            return
        }
        
        isLampOn = true
        self.lampImg.image = self.lampOn
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if !isLampOn {
            let lampOnAlert = UIAlertController(title: "경고", message: "이미 Off 상태 입니다.", preferredStyle: UIAlertController.Style.alert)
            let lampOnAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.destructive, handler: nil)
            lampOnAlert.addAction(lampOnAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in
                self.lampImg.image = self.lampOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        isLampOn = false
        self.lampImg.image = self.lampRemove
    }
}

